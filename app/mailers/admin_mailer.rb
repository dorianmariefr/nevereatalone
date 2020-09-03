class AdminMailer < ApplicationMailer
  def admin_notification_email
    @model = params[:model]
    @user = params[:user]
    subject = "#{@model.class}##{@model.id} changed: #{@model.to_s}"

    mail(to: @user.email, subject: subject)
  end
end
