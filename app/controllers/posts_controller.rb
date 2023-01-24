class PostsController < ApplicationController
  # GET /users/:user_id/posts
  def index
    @user = User.find(params[:user_id])
  end

  # GET /users/:user_id/posts/:id
  def show
    @post = Post.find(params[:id])
  end
end
