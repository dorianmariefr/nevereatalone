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
  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true

  def self.from_token(token)
    time, id = encryptor.decrypt_and_verify(Base64.decode64(token)).split("|")
    time = Time.zone.parse(time)
    return if time < 24.hours.ago
    User.find(id)
  rescue ActiveSupport::MessageEncryptor::InvalidMessage
    nil
  end

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

  def login_token
    Base64.encode64(
      self.class.encryptor.encrypt_and_sign("#{Time.zone.now.to_s}|#{id}")
    ).gsub("\n", "").gsub("=", "")
  end

  def to_s
    first_name
  end

  private

  def self.encryptor
    ActiveSupport::MessageEncryptor.new(
      Rails.application.secrets.secret_key_base[0..31]
    )
  end
end
