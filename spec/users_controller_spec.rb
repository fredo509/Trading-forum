require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }
    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders users index view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('list of all users')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1' }
    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders users show view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('User Details')
    end
  end
end