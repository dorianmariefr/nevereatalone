class Invitation < ApplicationRecord
  STATUSES = ["sent", "accepted", "declined"]

  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  belongs_to :availability

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :availability_id, uniqueness: { scope: [:from_user_id, :to_user_id] }

  scope :sent, -> { where(status: :sent) }
  scope :accepted, -> { where(status: :accepted) }
  scope :declined, -> { where(status: :declined) }

  scope :requested, -> {
    joins(:availability).where("invitations.to_user_id = availabilities.user_id")
  }

  scope :invited, -> {
    joins(:availability).where("invitations.from_user_id = availabilities.user_id")
  }

  validate do
    if from_user == to_user
      errors.add(:to_user, "ne peut pas être le même que celui qui invite")
    end

    if from_user != availability.user  && to_user != availability.user
      errors.add(:to_user, "doit être celui qui a créé le rendez-vous")
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

  def requested?
    availability.user == to_user
  end

  def invited?
    availability.user == from_user
  end

  def user
    requested? ? from_user : to_user
  end

  def to_s
    "de #{from_user} à #{to_user} pour #{availability}: #{status}"
  end
end
