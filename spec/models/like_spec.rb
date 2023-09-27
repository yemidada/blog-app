require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.new(name: 'Yemi Dada', photo: 'my image', bio: 'I love myself', posts_counter: 0) }
  let(:post) do
    Post.new(author_id: user.id, title: 'My first post', text: 'This is my first post', comments_counter: 0,
             likes_counter: 0)
  end
  let(:like) { Like.new(users_id: user.id, posts_id: post.id) }

  before { user.save! }
  before { post.save! }
  before { like.save! }

  it 'update_post_like_count should be called automatically on saveing likes' do
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
