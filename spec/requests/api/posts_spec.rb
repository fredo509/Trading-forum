require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    get 'List all posts for user with user_id' do
      tags 'Posts'
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

      response 200, 'Successful' do
        run_test!
      end

      response 400, 'User not found' do
        run_test!
      end
    end
  end
end
