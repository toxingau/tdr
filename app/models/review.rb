class Review < ApplicationRecord
  include PublicActivity::Model
  tracked only: :create,
    owner: ->controller, model{controller && controller.current_user},
    recipient: ->controller, model{model && model.user}

  acts_as_votable
  
  belongs_to :location
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  scope :user_exist, ->(user_id) {where "user_id = ?", user_id}

  has_many :comments, dependent: :destroy

  validates :location_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1000}
  validates :rating, presence: true
  #validate :check_rating
  after_create :update_location_rate_avg


  private
  def check_rating
    if rating < 1 || rating > 5
      errors.add :rating, I18n.t("review.validate_rating")
    end
  end

  def update_location_rate_avg
    location.update_rate_avg
  end
end
