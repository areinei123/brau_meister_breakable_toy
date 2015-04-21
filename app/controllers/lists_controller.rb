class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new 
    @recipe = Recipe.find(params[:recipe_id])
    @list = List.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_list = List.where(recipe_id: @recipe.id).sort_by { |list| list.ingredient_id }
    @list = @recipe.lists.new(list_params)
    if @list.save
      flash[:notice] = "Ingredient Added."
      redirect_to new_recipe_list_path(@recipe)
    else
      flash.now[:notice] = @list.errors.full_messages.join("! ")
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @list = List.find(params[:id])
    @list.destroy
    redirect_to new_recipe_list_path(@recipe)
  end
  
  private

  def list_params
    params.require(:list).permit(
      :recipe_id, :ingredient_id, :amount, :boil_time
    )
  end
end
