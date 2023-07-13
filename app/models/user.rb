class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_three_posts
    posts.includes(:comments, :likes).last(3)
  end
end
