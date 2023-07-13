class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes

  after_create :update_posts_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end
end
