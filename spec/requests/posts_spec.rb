require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/:user_id/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "should render 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for given user with comments and likes')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/users/:user_id/posts/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "should render 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('Here is a post description of the user')
    end
  end
end
