class Message < ApplicationRecord
  belongs_to :availability
  belongs_to :user

  validates :content, presence: true
end
