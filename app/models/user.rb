class User < ApplicationRecord
  has_secure_password

  has_one_attached :image

  has_many :availabilities, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
