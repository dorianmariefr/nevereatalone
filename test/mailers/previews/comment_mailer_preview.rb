class CommentMailerPreview < ActionMailer::Preview
  def received_comment_email
    CommentMailer.with(comment: Comment.last!).received_comment_email
  end
end
