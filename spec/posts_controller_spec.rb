require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }
    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index view' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/2' }
    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders show view' do
      expect(response).to render_template(:show)
    end

    it 'renders correct content' do
      expect(response.body).to include('Details of a post for a given user')
    end
  end
end 
