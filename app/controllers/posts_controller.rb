class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts
  end

  def new 
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
