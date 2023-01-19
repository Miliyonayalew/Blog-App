require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 1, post_id: 1, text: 'This is a comment') }
  before { subject.save }

  it 'Comment should have an author' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Comment should have a post' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'Comment should have text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'Comment counter method should be called after saving' do
    author = User.create(name: 'Miliyon', posts_counter: 0)
    post = Post.create(title: 'Post 1', author_id: author.id, comments_counter: 0, likes_counter: 0)
    Comment.create(author_id: author.id, post_id: post.id, text: 'This is a comment')
    lastpost = Post.last
    expect(lastpost.comments_counter).to eq(1)
  end
end
