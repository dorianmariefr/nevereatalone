class AdminMailer < ApplicationMailer
  def admin_notification_email
    @model = params[:model]
    @user = params[:user]

    mail(to: @user.email, subject: "#{@model.class}##{@model.id}: #{@model.to_s}")
  end
end
