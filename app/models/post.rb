class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments, dependent: :destroy, foreign_key: 'posts_id'
  has_many :likes, dependent: :destroy, foreign_key: 'posts_id'
  after_save :update_user_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end

  private

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end
end
