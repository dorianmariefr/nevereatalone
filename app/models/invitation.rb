class Invitation < ApplicationRecord
  STATUSES = ["sent", "accepted", "declined"]

  belongs_to :user
  belongs_to :availability

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :availability_id, uniqueness: { scope: :user_id }

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

  def sent?
    status == "sent"
  end

  def accepted?
    status == "accepted"
  end

  def declined?
    status == "declined"
  end

  def to_s
    "de #{user} pour #{availability}: #{status}"
  end
end
