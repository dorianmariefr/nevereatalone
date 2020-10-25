class AvailabilityMailer < ApplicationMailer
  def starts_at_changed_email
    @availability = params[:availability]
    @old_starts_at = params[:old_starts_at]
    @new_starts_at = params[:new_starts_at]
    @to = params[:to]
    @user = @to

    mail(
      to: @to.email,
      subject: "Changement de l'heure du rendez-vous #{@availability}"
    )
  end
end
