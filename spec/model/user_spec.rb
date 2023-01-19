require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Miliyon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a blogger', posts_counter: 0) }

  before { subject.save }

  it 'Validation should be successful' do
    expect(subject).to be_valid
  end

  it 'User should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'User name should be at least 3' do
    subject.name = 'Mi'
    expect(subject).to_not be_valid
  end

  it 'User name should be at most 20 characters' do
    subject.name = 'MiliyonMiliyonMiliyon'
    expect(subject).to_not be_valid
  end

  it 'User posts_counter should be an integer' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'User posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it "User's recent three posts should be in descending order" do
    author = User.create(name: 'Miliyon', posts_counter: 0)
    post1 = Post.create(title: 'Post 1', author_id: author.id, comments_counter: 0, likes_counter: 0)
    post2 = Post.create(title: 'Post 2', author_id: author.id, comments_counter: 0, likes_counter: 0)
    expect(author.recent_three_posts).to eq([post2, post1])
  end
end
