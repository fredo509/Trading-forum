require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of a user'
    parameter name: 'post_id', in: :path, type: :string, description: 'ID of a post'

    get 'List all comments on a user\'s post' do
      tags 'Comments'
      response 200, 'Successful' do
        run_test!
      end
    end

    post 'Create a comment on a user\'s post' do
      tags 'Comments'
      consumes 'application/json'

      parameter name: 'X-Token', in: :header, type: :string, description: 'API token', required: true
      parameter name: 'text', in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: [:text]
      }
      description 'Your API token is generated on sign up. It is located on your user profile page.'

      response 201, 'Comment created' do
        run_test!
      end

      response 400, 'Comment not created' do
        run_test!
      end
    end
  end
end
