class Recipe < ApplicationRecord
  has_and_belongs_to_many(:tags)

  scope :search, -> (ingredient_parameter) { where("ingredient like ?", "%#{ingredient_parameter}%")}
end