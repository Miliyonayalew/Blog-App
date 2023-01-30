require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'mila', photo: 'https://i.imgur.com/1JZ1Q2r.jpg', bio: 'I am a biology teacher',
                        posts_counter: 2)
  end

  describe 'GET #index' do
    before(:each) { get users_path(@user) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('Users')
    end

    it "does not render a 'show' template" do
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET #show' do
    before(:each) { get user_path(@user) }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'should return correct placeholder text' do
      expect(response.body).to include('User Post')
    end
  end
end
