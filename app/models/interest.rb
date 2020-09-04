class Interest < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  def to_s
    content
  end
end
