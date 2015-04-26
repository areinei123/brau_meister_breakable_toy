require 'rails_helper'

describe "extract_potential_to_gu" do
  it "should convert extract potential to gravity units" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 483)
    expect(list.ingredient.extract_potential_to_gu).to eq(26.999999999999915)
  end
end

describe "method_missing" do
  it "should create a method that determines true or false" do
    ingredient = Ingredient.create(name: "Whatever", extract_potential: nil,
      alpha_acid: nil, attenuation: nil, main_class: "Grain", sub_type: "Grain"
      )
    expect(ingredient.is_a_grain?).to eq(true)
  end
end