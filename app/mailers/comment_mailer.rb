class CommentMailer < ApplicationMailer
  def received_comment_email
    @comment = params[:comment]
    @from_user = @comment.from_user
    @to_user = @comment.to_user

    mail(
      to: @to_user.email,
      subject: "Nouveau commentaire de #{@from_user} sur ton profil"
    )
  end
end
