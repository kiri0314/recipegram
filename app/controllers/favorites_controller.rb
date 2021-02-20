class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @r = Recipe.all.order(id: "DESC")
    i = 0
    @recipes = []
    @favorites.each do |f|
      @r.each do |r|
        if f.recipe_id == r.id  
          @recipes[i] = r  
          i = i + 1
        end 
      end
    end
    # i = 0
    # @recipes = []
    # @favorites.each do |f|
    #   @recipes[i] = Recipe.where(id: f.recipe_id).order(id: "DESC")
    #   i = i + 1
    
    #end 
  end

  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    redirect_back(fallback_location: root_path)
  end 
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end  
end
