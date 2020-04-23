class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if !@post.nil?
      Comment.create_comment current_user.id, params[:post_id], comment_params
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private def comment_params
    params.require(:comment).permit(:body)
  end
end
