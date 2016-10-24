class Review < ApplicationRecord
  acts_as_votable
  
  belongs_to :location
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_many :comments, dependent: :destroy

  validates :location_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}
end
