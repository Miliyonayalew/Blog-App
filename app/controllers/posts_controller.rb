class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    # create a new post
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Post not created'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Post successfully destroyed.' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
