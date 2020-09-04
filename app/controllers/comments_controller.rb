class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment.from_user = current_user

    if @comment.save
      CommentMailer.with(comment: @comment).received_comment_email.deliver_now
      redirect_to @comment.to_user
    else
      redirect_to @comment.to_user, alert: @comment.full_error_messages
    end
  end

  def destroy
    @comment.destroy!

    redirect_to @comment.to_user
  end

  private

  def comment_params
    params.require(:comment).permit(:to_user_id, :content, :recommend)
  end
end
