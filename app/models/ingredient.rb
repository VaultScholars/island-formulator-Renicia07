class Ingredient < ApplicationRecord
end
class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
end