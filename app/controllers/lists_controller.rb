class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new 
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_list = List.where(recipe_id: @recipe.id).sort_by {|list| list.ingredient_id}
    @list = List.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @list = @recipe.lists.new(list_params)
    if @list.save
      flash[:notice] = "Ingredient Added."
      redirect_to new_recipe_list_path(@recipe)
    else
      flash[:notice] = @list.errors.full_messages.join("! ")
      render 'recipes/show'
    end
  end
  
  private

  def list_params
    params.require(:list).permit(
      :recipe, :ingredient_id, :amount
    )
  end
end
