class Comment < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  validates :content, presence: true

  def to_s
    "de #{from_user}, à #{to_user}: #{content}"
  end
end
