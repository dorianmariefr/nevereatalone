class Invitation < ApplicationRecord
  STATUSES = ["sent", "accepted", "declined"]

  belongs_to :user
  belongs_to :availability

  validates :status, presence: true, inclusion: { in: STATUSES }

  scope :sent, -> { where(status: :sent) }
  scope :accepted, -> { where(status: :accepted) }
  scope :declined, -> { where(status: :declined) }

  validate do
    if user == availability.user
      errors.add(
        :availability,
        "ne peut pas être une de vos de demandes de rendez-vous"
      )
    end
  end
end
