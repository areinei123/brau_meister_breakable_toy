require 'rails_helper'

feature 'view recipe maker' do
  context 'as an authenticated user' do
    before(:each) do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end
    scenario %{I want to view the recipe maker page} do
      visit root_path
      click_on 'Recipe Maker'

      expect(page).to have_button('Add Recipe')

    end

    pending %{I want to be able to look at all
    the grains I can add to my recipe
    } do
      visit new_recipe_grain_path
      click_on 'Grains'
      expect(page).to have_content('Grain')
      expect(page).to have_content('Extract')
      expect(page).to have_content('Adjunct')
      expect(page).to have_content('Sugar')
    end

    pending %{I want to be able to look at all the hops
    I can add to my recipe
    } do
      visit new_recipe_hop_path
      click_on 'Hops'
      expect(page).to have_content('U.S.')
      expect(page).to have_content('England')
      expect(page).to have_content('Austrailia')
      expect(page).to have_content('Germany')
      expect(page).to have_content('Czech Republic')
      expect(page).to have_content('Slovenia')
    end

    pending %{I want to be able to look at all the yeasts
    I can add to my recipe
    } do
      visit new_recipe_yeast_path
      click_on 'Yeast'
      expect(page).to have_content('Ale')
      expect(page).to have_content('Wheat')
      expect(page).to have_content('Lager')
      expect(page).to have_content('Belgian Ale')
      expect(page).to have_content('Sour')
    end

  end
end
