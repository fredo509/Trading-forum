# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = User.find(params['user_id']).posts

        render json: posts
      end
    end
  end
end
