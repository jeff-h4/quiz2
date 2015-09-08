class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @idea = Idea.find_by_id params[:idea_id]
    @comment.idea = @idea
    @comment.user = current_user
    if @comment.save
      redirect_to @idea, notice: "Comment created successfully"
    else
      flash[:alert] = "Comment could not be created"
      render @idea
    end

  end
  def destroy
    @comment = Comment.find params[:id]
    @idea = @comment.idea
    @comment.destroy
    redirect_to @idea
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
