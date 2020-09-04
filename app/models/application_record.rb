class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  has_paper_trail

  after_save do
    User.where(admin: true).find_each do |user|
      AdminMailer.with(user: user, model: self).admin_notification_email.deliver_now
    end
  end

  def full_error_messages
    errors.full_messages.to_sentence
  end
end
