class IngredientsController < ApplicationController
  def index
    
    @ingredients = Ingredient.all
  end

  def create
  @recipe = Recipe.find(params[:recipe_id])
  @ingredient = @recipe.ingredients.new(ingredient_params)
  @ingredient.user = current_user
  if @ingredient.save
    flash[:notice] = "ingredient Added."
    redirect_to recipe_path(@recipe)
  else
    flash[:notice] = @ingredient.errors.full_messages.join("! ")
    render 'recipes/show'
  end
end
