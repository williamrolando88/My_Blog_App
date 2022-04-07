require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'renders existing users' do
    before(:each) do
      @user = User.new(
        name: 'Admin',
        email: 'user1@gmail.com',
        password: 'password',
        password_confirmation: 'password',
        role: 'admin'
      )
      @user.skip_confirmation!
      @user.save!
    end

    # I can see the username of all other users.
    scenario 'rendering all users name' do
      visit root_path
      expect(page).to have_content('Admin')
    end
    
    # I can see the profile picture for each user.
    scenario 'shows the user img' do
      visit root_path
      expect(page).to have_css('img', class: 'img-thumbnail')
    end
    
    
    # I can see the number of posts each user has written.
    scenario 'rendering all users name' do
      visit root_path
      expect(page).to have_content('Number of posts: 0')
    end
    
    
    # When I click on a user, I am redirected to that user's show page.
    scenario 'rendering all users name' do
      visit root_path
      click_link 'Admin'
      expect(page).to have_current_path(user_path(@user))
    end
    
  end
end