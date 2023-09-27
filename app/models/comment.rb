class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_save :update_post_comments_counter
  after_destroy :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update_comments_counter
  end
end
