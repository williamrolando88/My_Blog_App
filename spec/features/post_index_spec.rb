require 'rails_helper'

feature 'Blog App on post#index' do
  describe 'renders a user posts' do
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

      @comments1 = Comment.create(
        text: 'Comment 1 text',
        author_id: @user.id,
        post_id: @post1.id
      )
      @comments1.comments_counter

      visit user_posts_path(@user)
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
    scenario 'shows first comment' do
      expect(page).to have_content('Comment 1 text')
    end

    # I can see how many comments a post has.
    scenario 'shows number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    # I can see how many likes a post has.
    scenario 'shows number of likes' do
      expect(page).to have_content('Likes: 0')
    end

    # When I click on a post, it redirects me to that post's show page.
    scenario 'redirects to post show page' do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end

