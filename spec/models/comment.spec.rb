require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.new(name: 'Yemi Dada', photo: 'my image', bio: 'I love myself', posts_counter: 0) }
  let(:post) do
    Post.new(author_id: user.id, title: 'My first post', text: 'This is my first post', comments_counter: 0,
             likes_counter: 0)
  end
  let(:comment) { Comment.new(User_id: user.id, Post_id: post.id, Text: 'This is my first comment') }

  before { user.save! }
  before { post.save! }
  before { comment.save! }

  it 'update_post_comment_count should be called automatically on saveing comments' do
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
