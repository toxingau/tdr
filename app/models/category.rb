class Category < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->controller, model{controller && controller.current_user}

  has_many :locations, dependent: :destroy

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", "category"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
