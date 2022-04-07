require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  describe 'renders login page when' do
    # I can see the username and password inputs and the "Submit" button.
    scenario 'visiting new_user_session_path' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end
  end

  describe 'when user attemps to login page with' do
    before(:each) do
      user = User.new(
        name: 'Admin',
        email: 'example@gmail.com',
        password: 'password',
        password_confirmation: 'password',
        role: 'admin'
      )
      user.skip_confirmation!
      user.save!
    end

    # When I click the submit button without filling in the username and the password, I get a detailed error.
    scenario 'an empty form, show error message' do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    # When I click the submit button after filling in the username and the password with incorrect data, I get a
    # detailed error.
    scenario 'a form with wrong credentials show error message' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'something@example.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    # When I click the submit button after filling in the username and the password with correct data, I am redirected
    # to the root page.
    scenario 'a form with rigth credentials does not show errors and redirect to root path' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'example@gmail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
