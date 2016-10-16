class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :location_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}
end
