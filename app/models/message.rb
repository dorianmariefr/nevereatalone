class Message < ApplicationRecord
  belongs_to :availability
  belongs_to :user

  validates :content, presence: true

  def to_s
    "de #{user} pour #{availability}: #{content}"
  end
end
