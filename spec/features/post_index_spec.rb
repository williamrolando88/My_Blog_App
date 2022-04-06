require 'rails_helper'

feature 'Blog App on user#show' do
  describe 'renders a user details' do
    background do
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
      expect(page).to have_content('Number of posts: 1')
    end

    # I can see a post's title.
    scenario 'shows post title' do
      expect(page).to have_content('Post 1')
    end
    
    # I can see some of the post's body.
    scenario 'shows post text' do
      expect(page).to have_content('Post 1 text')
    end

    # I can see the first comments on a post.
    # I can see how many comments a post has.
    # I can see how many likes a post has.
    # I can see a section for pagination if there are more posts than fit on the view.
    # When I click on a post, it redirects me to that post's show page.

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

