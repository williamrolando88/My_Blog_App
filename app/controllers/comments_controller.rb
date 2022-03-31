class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author_id = @user.id
    @comment.post_id = @post.id

    if @comment.save
      flash[:notice] = "Comment created!"
      redirect_to user_post_path(@user, @post)
    else
      flash[:notice] = "Comment was not created."
    end

    @comment.comments_counter
  end
end
