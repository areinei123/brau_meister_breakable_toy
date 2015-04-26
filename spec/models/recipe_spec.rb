require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to :user }

  it { should have_valid(:name).when("Fred's amazing ipa") }
  it { should have_valid(:batch_size).when(5) }
  it { should have_valid(:user).when(FactoryGirl.create(:user)) }

end

describe "total_gravity" do
  it "should calculate original gravity" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1448)
    expect(recipe.total_gravity).to eq(1.01944)
  end
end

describe "total_ibu" do
  it "should calculate ibu level" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1689)
    list1 = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1777, boil_time: 15)
    recipe.total_gravity
    expect(recipe.total_ibu).to eq(38.032221664995106)
  end
end

describe "total_abv" do
  it "should calculate abv" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1937)
    list1 = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 2060)
    recipe.total_gravity
    expect(recipe.total_abv).to eq(2.442888)
  end
end
