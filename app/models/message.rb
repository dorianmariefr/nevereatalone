class Message < ApplicationRecord
  belongs_to :availability
  belongs_to :user

  validates :content, presence: true

  def users
    availability.invitations.accepted.map(&:user) + [user]
  end
end
