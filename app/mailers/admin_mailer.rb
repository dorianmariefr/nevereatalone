class AdminMailer < ApplicationMailer
  def admin_notification_email
    @model = params[:model]
    @user = params[:user]
    @to_s = @model.respond_to?(:to_admin_s) ? @model.to_admin_s : @model.to_s

    mail(
      to: @user.email,
      subject: "#{Rails.env} #{@model.class}##{@model.id}: #{@to_s}"
    )
  end
end
