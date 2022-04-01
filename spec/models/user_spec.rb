require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'given a valid entry' do
    before :each do
      @test_user = User.new(
        name: 'Test User',
        photo: 'This is a test photo',
        bio: 'This is a test bio',
        posts_counter: 0)
    end

    it 'creates a new record?' do
      expect(@test_user.new_record?).to be true
    end

    it 'is valid?' do
      @test_user.save
      expect(@test_user).to be_valid
    end
  end

  describe 'given an invalid entry' do
    before :each do
      @test_user = User.new(
        name: 'Test User',
        photo: 'This is a test photo',
        bio: 'This is a test bio',
        posts_counter: 0)
    end

    it 'is invalid without a name' do
      @test_user.name = nil
      @test_user.save
      expect(@test_user).to_not be_valid
    end
    
    it 'is invalid with a posts_counter value of -1' do
      @test_user.posts_counter = -1
      @test_user.save
      expect(@test_user).to_not be_valid
    end
    
    it 'is invalid without a posts_counter value' do
      @test_user.posts_counter = nil
      @test_user.save
      expect(@test_user).to_not be_valid
    end
  end
end
