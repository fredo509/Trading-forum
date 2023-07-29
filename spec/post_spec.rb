# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations for Post model' do
    before(:each) do
      @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                       comments_counter: 0)
    end

    it 'Title must not be blank' do
      @post.title = nil
      expect(@post).to_not be_valid

      @post.title = 'Hello'
      expect(@post).to be_valid
    end

    it 'Title must not exceed 250 characters' do
      @post.title = 'less than 250 characters'
      expect(@post).to be_valid
    end

    it 'Title must not exceed 250 characters' do
      @post.title = 'abc' * 100 ## post tile is more that 250 characters
      expect(@post).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero' do
      @post.comments_counter = 'string'
      expect(@post).to_not be_valid

      @post.comments_counter = -1
      expect(@post).to_not be_valid

      @post.comments_counter = 1
      expect(@post).to be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero' do
      @post.likes_counter = 'string'
      expect(@post).to_not be_valid

      @post.likes_counter = -1
      expect(@post).to_not be_valid

      @post.likes_counter = 1
      expect(@post).to be_valid
    end

    it 'should return less than 5 comments ' do
      value = @post.recent_comments.length
      expect(value).to be < 5
    end
  end
end
