class PostsController < ApplicationController
  # GET /users/:user_id/posts
  def index
    @posts = Post.all
  end

  # GET /users/:user_id/posts/:id
  def show
    @post = Post.find(params[:id])
  end
end
