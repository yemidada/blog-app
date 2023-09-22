require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Yemi Dada', photo: 'image', bio: 'I love myseld', posts_counter: 0) }
  before { subject.save! }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be numerical' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'PostCounter can be 0' do
    subject.name = 0
    expect(subject).to be_valid
  end

  it 'recent three posts ' do
    subject.posts.create!(title: 'My first post', text: 'First post', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'My second post', text: 'Second post', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'My third post', text: 'Third post', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'My fourth post', text: 'Fourth post', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'My fifth post', text: 'Fifth post', comments_counter: 0, likes_counter: 0)

    expect(subject.recent_posts.length).to eq(3)
  end
end
