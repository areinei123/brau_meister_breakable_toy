class RecipesController < ApplicationController
  def index
    if current_user
      @user_recipes = Recipe.where(user_id: "#{current_user.id}")
    end
    @public_recipes = Recipe.where(visibility: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @list = List.new
  end

  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.new
    @list = List.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = "Recipe Added."
      redirect_to recipes_path
    else
      flash[:notice] = @recipe.errors.full_messages[0]
      render :new
    end
  end

  protected

  def recipe_params
    params.require(:recipe).permit(
      :name, :visibility, :batch_size
    )
  end
end
