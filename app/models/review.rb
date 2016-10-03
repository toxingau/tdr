class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user

  has_many :comments, dependent: :destroy
end
