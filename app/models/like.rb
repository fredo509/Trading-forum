# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :update_post_likes_counter

  def update_post_likes_counter
    post.update_likes_counter
  end
end
