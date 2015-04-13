class RecipesController < ApplicationController
  def index
      @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
    # @grains = Ingredient.where(type_class:"Grain")
    # @extracts = Ingredient.where(type_class:"Extract")
    # @adjuncts = Ingredient.where(type_class:"Adjunct")
    # @sugars = Ingredient.where(type_class:"Sugar")
    # @us_hops = Ingredient.where(type_class:"U.S.")
    # @england_hops = Ingredient.where(type_class:"England")
    # @australia_hops = Ingredient.where(type_class:"Australia")
    # @german_hops = Ingredient.where(type_class:"Germany")
    # @czech_hops = Ingredient.where(type_class:"Czech Republic")
    # @japan_hops = Ingredient.where(type_class:"Japan")
    # @new_z_hops = Ingredient.where(type_class:"New Zealand")
    # @slovenia_hops = Ingredient.where(type_class:"Slovenia")
    # @weisse = Ingredient.where(type_class:"Weisse")
    # @lager = Ingredient.where(type_class:"Lager")
    # @ale = Ingredient.where(type_class:"Ale")
    # @belgian = Ingredient.where(type_class:"Belgian Ale")
    # @sour = Ingredient.where(type_class:"Sour")

  end

  def new
    @ingredients = Ingredient.all
    # @grains = Ingredient.where(type_class:"Grain")
    # @extracts = Ingredient.where(type_class:"Extract")
    # @adjuncts = Ingredient.where(type_class:"Adjunct")
    # @sugars = Ingredient.where(type_class:"Sugar")
    # @us_hops = Ingredient.where(type_class:"U.S.")
    # @england_hops = Ingredient.where(type_class:"England")
    # @australia_hops = Ingredient.where(type_class:"Australia")
    # @german_hops = Ingredient.where(type_class:"Germany")
    # @czech_hops = Ingredient.where(type_class:"Czech Republic")
    # @japan_hops = Ingredient.where(type_class:"Japan")
    # @new_z_hops = Ingredient.where(type_class:"New Zealand")
    # @slovenia_hops = Ingredient.where(type_class:"Slovenia")
    # @weisse = Ingredient.where(type_class:"Weisse")
    # @lager = Ingredient.where(type_class:"Lager")
    # @ale = Ingredient.where(type_class:"Ale")
    # @belgian = Ingredient.where(type_class:"Belgian Ale")
    # @sour = Ingredient.where(type_class:"Sour")
    @recipe = Recipe.new
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
