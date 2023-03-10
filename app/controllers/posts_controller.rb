class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
