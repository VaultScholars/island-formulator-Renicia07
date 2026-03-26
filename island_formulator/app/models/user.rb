class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipes, dependent: :destroy #This allows us to call current_user.recipes to get all recipes belonging to the logged-in user
  has_many :inventory_items, dependent: :destroy
  has_many :batches, dependent: :destroy
  has_many :favorites, dependent: :destroy #One user can have many favorites and once this user is deleted, all favorites for that user is also destroyed
  has_many :favorite_recipes, through: :favorites, source: :recipe #User can have many favorite recipes through the join table: favorites

  def favorited?(recipe)
    favorites.exists?(recipe: recipe)
  end
  
  # Add validations for better error messages
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true
end


 