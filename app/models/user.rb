class User < ApplicationRecord
  extend FriendlyId

  friendly_id :first_name, use: :slugged

  has_secure_password

  has_one_attached :image

  has_many :availabilities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :received_comments, class_name: "Comment", foreign_key: :to_user_id, dependent: :destroy
  has_many :sent_comments, class_name: "Comment", foreign_key: :from_user_id, dependent: :destroy
  has_many :received_direct_messages, class_name: "DirectMessage", foreign_key: :to_user_id, dependent: :destroy
  has_many :sent_direct_messages, class_name: "DirectMessage", foreign_key: :from_user_id, dependent: :destroy
  has_many :received_invitations, class_name: "Invitation", foreign_key: :to_user_id, dependent: :destroy
  has_many :sent_invitations, class_name: "Invitation", foreign_key: :from_user_id, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true

  def email=(e)
    e = e.strip.downcase if e
    super
  end

  def should_generate_new_friendly_id?
    slug.nil? || first_name_changed?
  end

  def square_image
    image.variant(
      combine_options: {
        resize: '150x150^',
        extent: '150x150',
        gravity: 'Center'
      }
    )
  end

  def to_s
    first_name
  end
end
