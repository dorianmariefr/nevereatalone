class ApplicationMailer < ActionMailer::Base
  default from: "pas-de-reponse@jamaismangerseul.fr"
  layout "mailer"

  before_action do
    attachments.inline['logo.png'] = File.read(Rails.root.join("app/assets/images/logo.png"))
  end
end

