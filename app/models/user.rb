class User < ApplicationRecord
  extend FriendlyId

  friendly_id :full_name, use: :slugged

  has_secure_password

  has_one_attached :image

  has_many :availabilities, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :received_comments, class_name: "Comment", foreign_key: :to_user_id, dependent: :destroy
  has_many :sent_comments, class_name: "Comment", foreign_key: :from_user_id, dependent: :destroy
  has_many :interests, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def should_generate_new_friendly_id?
    slug.nil? || first_name_changed? || last_name_changed?
  end

  def to_s
    full_name
  end
end
