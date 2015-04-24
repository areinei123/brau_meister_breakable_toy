require 'rails_helper'

RSpec.describe ListHelper, :type => :helper do
  describe "#calculate_gravity" do
    it "returns correct gravity _i dont know if this is correct" do
      @total_gravity = 0
      @recipe = FactoryGirl.create(:recipe)

      ingredient =Ingredient.create(name:'Vienna Malt', type_class: 'Grain',
       extract_potential: 1.036, alpha_acid: nil, attenuation: nil)

      @recipe.lists.new({"ingredient_id"=>ingredient.id, "amount"=> "1.0", "boil_time"=>"0"})

      expect(helper.calculate_gravity).to eq(1.005)
    end
  end

  describe "#calculate_whatever" do
  end
  describe "#calculate_test_nerd" do
  end

end
