require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    User.create(name: 'Miliyon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a blogger',
                posts_counter: 0)
  end

  before(:each) do
    @new_post = Post.new(title: 'Post 1', author_id: subject.id, comments_counter: 0, likes_counter: 0)
  end

  it 'Validation should be successful' do
    expect(@new_post).to be_valid
  end

  it 'Post should have a title' do
    @new_post.title = nil
    expect(@new_post).to_not be_valid
  end

  it 'Post title should be at most 250 characters' do
    @new_post.title = 'm' * 251
    expect(@new_post).to_not be_valid
  end

  it 'Post comments_counter should be an integer' do
    @new_post.comments_counter = 'one'
    expect(@new_post).to_not be_valid
  end

  it 'Post comments_counter should be greater than or equal to 0' do
    @new_post.comments_counter = -1
    expect(@new_post).to_not be_valid
  end

  it 'Post likes_counter should be an integer' do
    @new_post.likes_counter = 'one'
    expect(@new_post).to_not be_valid
  end

  it 'Post likes_counter should be greater than or equal to 0' do
    @new_post.likes_counter = -1
    expect(@new_post).to_not be_valid
  end

  it "Post's recent five comments should be displayed" do
    post = Post.create(title: 'Post 1', author_id: subject.id, comments_counter: 0, likes_counter: 0)
    comment1 = Comment.create(text: 'Comment 1', author_id: subject.id, post_id: post.id)
    comment2 = Comment.create(text: 'Comment 2', author_id: subject.id, post_id: post.id)
    comment3 = Comment.create(text: 'Comment 3', author_id: subject.id, post_id: post.id)
    comment4 = Comment.create(text: 'Comment 4', author_id: subject.id, post_id: post.id)
    comment5 = Comment.create(text: 'Comment 5', author_id: subject.id, post_id: post.id)
    expect(post.recent_five_comments).to eq([comment1, comment2, comment3, comment4, comment5])
  end

  it "Post's counter should be updated after saving" do
    author = User.create(name: 'Miliyon', posts_counter: 0)
    Post.create(title: 'Post 1', author_id: author.id, comments_counter: 0, likes_counter: 0)
    lastuser = User.last
    expect(lastuser.posts_counter).to eq(1)
  end
end
