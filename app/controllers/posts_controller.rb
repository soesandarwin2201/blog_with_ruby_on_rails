class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = Post.all
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])
  end
end
