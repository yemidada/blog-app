class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'users_id'
  has_many :likes, dependent: :destroy, foreign_key: 'users_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
