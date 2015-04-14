class HomesController < ApplicationController
  def index
    @public_recipes = Recipe.where(visibility: true)
    if current_user
      @user_recipes = Recipe.where(user_id: "#{current_user.id}")
    end
  end
end
