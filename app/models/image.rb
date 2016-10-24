class Image < ApplicationRecord
  mount_uploader :img, ImageUploader
  
  belongs_to :location

  validates :img, presence: true
  validates :location_id, presence: true
end
