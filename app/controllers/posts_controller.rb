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
    @comments = @post.recent_comments
  end

  def create
    @post = Post.new(
      title: post_params[:title],
      text: post_params[:text],
      author: current_user,
      commentscounter: 0,
      likescounter: 0
    )
    if @post.save
      @post.update_user_posts_counter
      redirect_to user_posts_path current_user.id
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
