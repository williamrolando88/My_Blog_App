class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id]||params[:post_id])
    @comments = @post.comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    # @post = @user.posts.new(params.require(:post).permit(:title, :text))
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author_id = @user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(@user)
    else
      flash[:notice] = "Post was not created."
      render :new
    end
  end
end
