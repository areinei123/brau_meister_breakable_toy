require 'rails_helper'

RSpec.describe List, type: :model do
  it { should have_valid(:amount).when(2) }
  it { should have_valid(:boil_time).when(15) }
end

describe "individual_gravity" do
  it "should calculate original gravity" do
    load Rails.root + "db/seeds.rb"
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 483)
    expect(list.individual_gravity).to eq(19.439999999999937)
  end
end

describe "extract_potential_to_gu" do
  it "should convert extract potential to gravity units" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 724)
    expect(list.extract_potential_to_gu).to eq(26.999999999999915)
  end
end

describe "individual_ibu_level" do
  it "should calculate ibu level" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 965)
    list1 = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1037, boil_time: 15)
    expect(list1.individual_ibu_level(list.individual_gravity)).to eq(76.06444332999021)
  end
end

describe "og_to_abv" do
  it "should convert extract potential to gravity units" do
    load Rails.root + "db/seeds.rb" 
    recipe = FactoryGirl.create(:recipe)
    list = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1206)
    list1 = FactoryGirl.create(:list, recipe_id: recipe.id, ingredient_id: 1337)
    expect(list1.og_to_abv(list.individual_gravity)).to eq(1.7571816000000033)
  end
end
