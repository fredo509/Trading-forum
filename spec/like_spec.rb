require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations For the Like model' do
    before(:each) do
      @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                          comments_counter: 0)
      @like = Like.new(author_id: @user.id, post_id: @post.id)
    end

    it 'author_id must not be blank' do
      @like.author_id = nil
      expect(@like).to_not be_valid
    end

    it 'post_id must not be blank' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'should update_post_likes_counter' do
      expect do
        @like.save
        @post.reload
      end.to change(@post, :likes_counter).by(1)
    end
  end
end
