class ApplicationMailer < ActionMailer::Base
  add_template_helper(MailerHelper)
  default from: "pas-de-reponse@jamaismangerseul.fr"
  layout "mailer"
end

