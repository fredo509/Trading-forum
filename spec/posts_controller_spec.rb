require 'rails_helper'

RSpec.describe '/users/posts', type: :request do
  let(:person1) do
    User.create(
      name: 'Precious Betine',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Student at Microverse.',
      posts_counter: 0
    )
  end

  let(:first_post) do
    Post.create(
      author: person1,
      title: 'First Post',
      text: 'This is my first post',
      likes_counter: 0,
      comments_counter: 0
    )
  end

  let(:second_post) do
    Post.create(
      author: person1,
      title: 'Second Post',
      text: 'This is my second post',
      likes_counter: 0,
      comments_counter: 0
    )
  end

  before do
    person1
    first_post
    second_post
  end

  context 'GET /index' do
    it 'renders a list of a user\'s posts' do
      get "/users/#{person1.id}/posts"
      expect(response.status).to eq 200
      expect(response).to render_template 'posts/index'
      expect(response.body).to include first_post.text
      expect(response.body).to include second_post.text
    end
  end

  context 'GET /show' do
    it 'renders a particular post for a given user' do
      get "/users/#{person1.id}/posts/#{first_post.id}"
      expect(response.status).to eq 200
      expect(response).to render_template 'posts/show'
      expect(response.body).to include first_post.title
      expect(response.body).to include first_post.text
    end
  end
end