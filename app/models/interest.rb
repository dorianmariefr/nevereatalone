class Interest < ApplicationRecord
  extend FriendlyId

  friendly_id :content, use: :slugged

  belongs_to :user

  validates :content, presence: true

  def should_generate_new_friendly_id?
    slug.nil? || content_changed?
  end

  def to_s
    "pour #{user}: #{content}"
  end
end
