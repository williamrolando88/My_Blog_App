require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  describe 'renders a user details' do
    before(:each) do
      @user = User.new(
        name: 'Admin',
        email: 'user2@gmail.com',
        password: 'password',
        password_confirmation: 'password',
        role: 'admin',
        bio: 'I am a bio'
      )
      @user.skip_confirmation!
      @user.save!

      @post1 = Post.create(
        title: 'Post 1',
        text: 'Post 1 text',
        author_id: @user.id
      )
      @post1.update_post_counter
      @post2 = Post.create(
        title: 'Post 2',
        text: 'Post 2 text',
        author_id: @user.id
      )
      @post2.update_post_counter
      @post3 = Post.create(
        title: 'Post 3',
        text: 'Post 3 text',
        author_id: @user.id
      )
      @post3.update_post_counter

      visit user_path(@user)
    end

    # I can see the user's profile picture.
    scenario 'shows profile picture' do
      expect(page).to have_css('img', class: 'img-thumbnail')
    end

    # I can see the user's username.
    scenario 'shows user name' do
      expect(page).to have_content('Admin')
    end

    # I can see the number of posts the user has written.
    scenario 'shows number of posts' do
      expect(page).to have_content('Number of posts: 3')
    end

    # I can see the user's bio.
    scenario 'shows user bio' do
      expect(page).to have_content('I am a bio')
    end

    # I can see the user's first 3 posts.
    scenario 'shows first 3 post' do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 3')
    end

    # I can see a button that lets me view all of a user's posts.
    scenario 'shows button to see all posts' do
      expect(page).to have_content('See all posts')
    end

    # When I click a user's post, it redirects me to that post's show page.
    scenario 'redirects to post show page' do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end

    # When I click to see all posts, it redirects me to the user's post's index page.
    scenario 'redirects to post index page' do
      click_button 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
