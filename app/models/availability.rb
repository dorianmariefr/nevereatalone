class Availability < ApplicationRecord
  belongs_to :user

  validates :starts_at, presence: true
  validates :location, presence: true

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
end
