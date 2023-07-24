require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:person1) do
    User.create(
      name: 'Precious Betine',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Student at Microverse.',
      posts_counter: 0,
      id:1
    )
  end

  let(:person2) do
    User.create(
      name: 'John Doe',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Student at Unknown.',
      posts_counter: 0,
      id:2
    )
  end

  before do
    person1
    person2
  end

  context 'GET /index' do
    it 'renders a list of all users' do
      get '/'
      expect(response.status).to eq 200
      expect(response).to render_template 'users/index'
      expect(response.body).to include person1.name
      expect(response.body).to include person2.name
    end
  end

  context 'GET /show' do
    it 'renders a user' do
      get "/users/#{person1.id}"
      expect(response.status).to eq 200
      expect(response).to render_template 'users/show'

      expect(response.body).to include person1.name
      expect(response.body).to include person1.bio
    end
  end
end