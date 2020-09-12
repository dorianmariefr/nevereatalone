class Availability < ApplicationRecord
  belongs_to :user

  has_many :invitations, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :starts_at, presence: true
  validates :location, presence: true

  scope :past, -> { where("starts_at < ?", Time.zone.now) }
  scope :recent, -> { where("starts_at >= ?", Time.zone.now) }

  after_initialize do
    if Time.zone.now > Time.zone.now.beginning_of_day + 19.hours
      self.starts_at ||= Time.zone.now.beginning_of_day + 1.day + 19.hours
    else
      self.starts_at ||= Time.zone.now.beginning_of_day + 19.hours
    end

    if user
      self.location ||= user.availabilities.last&.location
    end
  end

  validate do
    if starts_at && starts_at < Time.zone.now
      errors.add(:starts_at, "doit être dans le futur")
    end
  end

  after_save do
    if saved_change_to_starts_at?
      conversation_users.without(user).each do |user|
        AvailabilityMailer.with(
          availability: self,
          old_starts_at: saved_changes["starts_at"].first,
          new_starts_at: saved_changes["starts_at"].second,
          to: user,
        ).starts_at_changed_email.deliver_now
      end
    end
  end

  def conversation_users
    invitations.accepted.map(&:user) + [user]
  end

  def past?
    starts_at < Time.zone.now
  end

  def recent?
    !past?
  end

  def to_s
    time = I18n.l(starts_at, format: "le %A %e %B à %kh%M")
    "#{time} à #{location}"
  end
end
