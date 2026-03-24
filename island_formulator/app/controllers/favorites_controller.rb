class FavoritesController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorites.create(recipe: recipe)
    redirect_to recipes_path
  end

  def destroy
    favorite = current_user.favorites.find_by(recipe_id: params[:recipe_id])
    favorite.destroy if favorite
    redirect_to recipes_path
  end
end
