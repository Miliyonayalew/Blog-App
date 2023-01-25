require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path(1) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "should render 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('User')
    end
  end

  describe 'GET /show' do
    before(:example) { get users_path(1) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "should render 'show' template" do
      expect(response).to render_template(:index)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('User')
    end
  end
end
