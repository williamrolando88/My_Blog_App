require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'given a valid entry' do
    before :each do
      @test_post = Post.new(
        title: 'Test Post',
        text: 'This is a test post',
        comments_counter: 0,
        likes_counter: 0,
        author_id: 3
      )
    end

    it 'creates a new record?' do
      expect(@test_post.new_record?).to be true
    end

    it 'title is valid?' do
      @test_post.save
      expect(@test_post).to be_valid
    end
  end

  describe 'given an invalid entry' do
    before :each do
      @test_post = Post.new(
        title: nil,
        text: 'This is a test post',
        comments_counter: nil,
        likes_counter: nil
      )
    end

    it 'is invalid without a title' do
      @test_post.save
      expect(@test_post).to_not be_valid
    end

    it 'is invalid without a comments_counter' do
      @test_post.save
      expect(@test_post).to_not be_valid
    end

    it 'is invalid without a likes_counter' do
      @test_post.save
      expect(@test_post).to_not be_valid
    end

    it 'is invalid with a comments_counter value of -1' do
      @test_post.comments_counter = -1
      @test_post.save
      expect(@test_post).to_not be_valid
    end

    it 'is invalid with a likes_counter value of -1' do
      @test_post.likes_counter = -1
      @test_post.save
      expect(@test_post).to_not be_valid
    end
  end
end
