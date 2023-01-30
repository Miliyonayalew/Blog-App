require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'mila', photo: 'https://i.imgur.com/1JZ1Q2r.jpg', bio: 'I am a biology teacher',
                        posts_counter: 2)
    @post = Post.create(author: @user, title: 'My first post', text: 'This is my first post', comments_counter: 1,
                        likes_counter: 2)
  end

  describe 'GET post#index' do
    before(:each) { get user_posts_path(@user) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('Users All Posts')
    end

    it "does not render a 'show' template" do
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET post#show' do
    before(:each) { get user_post_path(@user, @post) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('Here is a post description of the user')
    end
  end
end
