class Comment < ApplicationRecord
  belongs_to :posts, class_name: :Post
  belongs_to :users, class_name: :User
  after_save :update_post_comments_counter
  after_destroy :update_post_comments_counter

  private

  def update_post_comments_counter
    posts.update_comments_counter
  end
end
