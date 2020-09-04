class DirectMessage < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  validates :content, presence: true

  def self.between(user, other_user)
    DirectMessage.where(from_user: user, to_user: other_user).or(
      DirectMessage.where(from_user: other_user, to_user: user)
    )
  end

  def to_s
    content
  end
end
