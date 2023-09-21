class Like < ApplicationRecord
  belongs_to :posts
  belongs_to :users
  after_save :update_post_likes_counter
  after_destroy :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update_likes_counter
  end
end
