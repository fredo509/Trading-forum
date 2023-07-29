# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  attribute :email, :string
  attribute :username, :string
  attribute :encrypted_password, :string
  validates :name, presence: true, allow_blank: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  before_save :generate_api_token

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(16)
  end
end
