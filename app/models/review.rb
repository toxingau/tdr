class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_many :comments, dependent: :destroy

  validates :location_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}
  validates :rate, numericality: 
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
end
