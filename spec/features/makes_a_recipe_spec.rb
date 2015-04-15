require 'rails_helper'

feature 'Add ingredients to a recipe' do
  context 'As an authenticated user' do
    before(:each) do
      user = FactoryGirl.create(:user)
      recipe = FactoryGirl.create(:recipe)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end

    scenario %{I want to be able to add grains to my recipe, so that 
    i can create fermentable sugars
    } do
      visit recipes_path
      click_on "New Stout"
      within("//div[@class='grain']") do
        select 'Pilsner (2 Row)', from: "list_ingredient_id"
        fill_in 'list_amount', with: 10
        click_button 'Submit'
      end

      expect(page).to have_content('Pilsner (2 Row) x10.0 lbs')
    end

    scenario %{I want to be able to add hops to my recipe, so that 
    i can make my beer more bitter and therefore more palatable
    } do
      visit recipes_path
      click_on "New Stout"
      within("//div[@class='america']") do
        select 'Amarillo', from:'list_ingredient_id'
        fill_in 'list_amount', with: 3
        click_button 'Submit'
      end
      expect(page).to have_content('Amarillo x3.0 oz.')
    end

    scenario %{I want to be able to add yeast to my recipe,
    because i love bubbles
    } do
      visit recipes_path
      click_on "New Stout"
      within("//div[@class='sour']") do
        select 'Berliner Blend GB122', from:'list_ingredient_id'
        click_button 'Submit'
      end
      expect(page).to have_content('Berliner Blend GB122')
    end
  end
end
