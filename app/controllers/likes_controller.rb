class LikesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(author: @user, post: @post)

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      flash[:notice] = "Error!"
    end

    @like.likes_counter
  end
end
