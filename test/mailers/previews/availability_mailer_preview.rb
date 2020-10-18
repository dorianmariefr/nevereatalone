class AvailabilityMailerPreview < ActionMailer::Preview
  def starts_at_changed_email
    AvailabilityMailer.with(
      availability: Availability.last,
      old_starts_at: 24.hours.from_now,
      new_starts_at: 26.hours.from_now,
      to: User.last,
    ).starts_at_changed_email
  end
end
