require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Comment model' do
    before(:each) do
      @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                          comments_counter: 0)
      @comment = Comment.new(text: 'comment1', author_id: 1, post_id: 2)
    end

    it 'Text must not be blank' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id must be an integer' do
      @comment.author_id = 'char'
      expect(@comment).to_not be_valid
    end

    it 'post_id must be an integer' do
      @comment.post_id = 'char'
      expect(@comment).to_not be_valid
    end

    it 'Should update_post_comments_counter' do
      comment = Comment.new(author: @user, post: @post)
      comment.save
      expect(@post.comments_counter).to be 1
    end
  end
end
