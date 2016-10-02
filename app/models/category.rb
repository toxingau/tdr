class Category < ApplicationRecord
  has_many :locations, dependent: :destroy
end
