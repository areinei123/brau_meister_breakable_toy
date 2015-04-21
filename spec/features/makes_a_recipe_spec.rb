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
      click_on "Recipe Maker"
      fill_in "recipe_name", with: "Pale Ale"
      fill_in "recipe_batch_size", with: 10
      click_on "Add Recipe"
      click_on "Pale Ale" 
      within("//div[@class='grain']") do
        select 'Pilsner (2 Row)', from: "list_ingredient_id"
        fill_in 'list_amount', with: 10
        click_button 'Submit'
      end

      expect(page).to have_content('Pilsner (2 Row)')


      click_link '(Delete)'
      expect(page).to_not have_content('Pilsner (2 Row) x10lbs.')

      within("//div[@class='grain']") do
        select 'Pilsner (2 Row)', from: "list_ingredient_id"
        fill_in 'list_amount', with: 10
        click_button 'Submit'
      end

      within("//div[@class='america']") do
        select 'Amarillo', from:'list_ingredient_id'
        fill_in 'list_amount', with: 3
        fill_in 'list_boil_time', with: 15
        click_button 'Submit'
      end
      within("//div[@class='sour']") do
        select 'Berliner Blend GB122', from:'list_ingredient_id'
        click_button 'Submit'
      end
      expect(page).to have_content('Amarillo')
      expect(page).to have_content('Pilsner (2 Row)')
      expect(page).to have_content('Berliner Blend GB122')
      expect(page).to have_content('OG: 1.026')
      expect(page).to have_content('IBU: 17.2')
      expect(page).to have_content('ABV: 3.02%')

    end
  end
end
