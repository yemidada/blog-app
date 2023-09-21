class Post < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_many :likes
  after_save :update_user_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_comments_counter
    update(comments_count: comments.count)
  end

  def update_likes_counter
    update(likes_count: likes.count)
  end

  private

  def update_user_posts_counter
    user.increment!(:posts_count)
  end
end
