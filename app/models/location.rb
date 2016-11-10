class Location < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->controller, model{controller && controller.current_user}

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy

  mount_uploader :picture, PictureUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, length: {maximum: 150}, presence: true
  validates :category_id, presence: false
  validates :rate_avg, presence: true,format: {with: /\A\d+(?:.\d{0,2})?\z/},
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validate  :picture_size

  scope :best_book, -> do
    order("rate_avg DESC").limit(5)
  end

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", "introduction", "picture", "address", "latitude", "longitude"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def update_rate_avg
    if self.reviews.size > 0
      @value =  self.reviews.average :rating
      update_attributes rate_avg: @value.to_f.round(2)
    end
  end

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, I18n.t(:picturesize)
    end
  end
end
