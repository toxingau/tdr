class Category < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->controller, model{controller && controller.current_user}

  has_many :locations, dependent: :destroy
end
