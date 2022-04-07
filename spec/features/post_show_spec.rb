require 'rails_helper'

feature 'Blog App on root path' do
  describe 'render a single post details' do
    background do
      @user = User.new(
        name: 'Admin',
        email: 'user3@gmail.com',
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

      @like1 = Like.create(
        author_id: @user.id,
        post_id: @post1.id
      )
      @like1.likes_counter

      visit user_post_path(@user, @post1)
    end

    # I can see the post's title.
    scenario 'shows post title' do
      expect(page).to have_content('Post 1')
    end

    # I can see who wrote the post.
    scenario 'shows post author' do
      expect(page).to have_content('Author: Admin')
    end

    # I can see how many comments it has.
    scenario 'shows number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    # I can see how many likes it has.
    scenario 'shows number of likes' do
      expect(page).to have_content('Likes: 1')
    end

    # I can see the post body.

    # I can see the username of each commentor.

    # I can see the comment each commentor left.

  end
end
