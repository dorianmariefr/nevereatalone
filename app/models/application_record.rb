class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  has_paper_trail

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
