class Like < ApplicationRecord
  belongs_to :posts, class_name: :Post
  belongs_to :users, class_name: :User

  after_save :update_post_likes_counter
  after_destroy :update_post_likes_counter

  private

  def update_post_likes_counter
    posts.update_likes_counter
  end
end
