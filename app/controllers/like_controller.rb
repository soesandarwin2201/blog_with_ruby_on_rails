class LikeController < ApplicationController

  def new 
    @like = Like.new
    respond_to do |format|
      format.html { render :new, locals: { post: @like } }
    end
  end 

  def create
    @like = Like.new
    @like.author = current_user
    @like.post = Post.find(params[:post_id]) 
    if @like.save
      redirect_to user_post_path(@like.post.author, @like.post)
    else 
      render :new
  end
end
end
