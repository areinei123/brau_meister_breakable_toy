require 'rails_helper'

feature 'Add ingredients to a recipe' do
  context 'As an authenticated user' do
    before(:each) do
      user = FactoryGirl.create(:user)
      recipe = FactoryGirl.create(:recipe, user_id: user.id)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end
    scenario %{I want to be able to add grains to my recipe and i want
      to be able to take them away as well
    } do
      load Rails.root + "db/seeds.rb"
      click_on "All Recipes"
      within("//table[@class='your-recipes']") do
        click_on "(Delete)"
      end
      expect(page).to_not have_content("New Stout")
    end
  end
end