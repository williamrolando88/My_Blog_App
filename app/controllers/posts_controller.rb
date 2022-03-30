class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end


end
