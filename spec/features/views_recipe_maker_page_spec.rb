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

    scenario %{I want to be able to set the amount of water I want to be
    in my batch, so that I can make estimations about the OG and IBU.
    }do
      visit new_recipe_path
      fill_in 'Name', with: 'The Best Pale Ale'
      fill_in 'Batch size', with: '5'
      click_on 'Add Recipe'

      expect(page).to have_content('The Best Pale Ale')
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

    pending %{I want to be able to have an estimated Original Gravity so that
    I can get a sense for how strong my beer might be
    } do
      visit new_recipe_path
      click_on 'Grains'
      page.select 'Pilsner (2 Row)', :from => 'Grain'
      fill_in 'Weight', with:'5'
      click_on 'Add'
      page.select 'Light Dry', :from => 'Extract'
      fill_in 'Weight', with: '2.5'
      click_on 'Add'
      expect(page).to have_content('OG: 1.055')
    end

    pending %{I want to be able to add hops to my recipe, in order to make
    it more bitter and therefore somehow more palatable
    } do
      visit new_recipe_path
      click_on 'Hops'
      page.select 'Citra', :from => 'U.S.'
      fill_in 'Weight', with:'1.5'
      fill_in 'Time after boil', with: '15'
      click_on 'Add'
      page.select 'Citra', :from => 'U.S.'
      fill_in 'Weight', with:'1.5'
      fill_in 'Time after boil', with: '30'
      click_on 'Add'
      page.select 'Citra', :from => 'U.S.'
      fill_in 'Weight', with:'1.5'
      fill_in 'Time after boil', with: '45'
      click_on 'Add'

      expect(page).to have_content('Estimated IBU:')

    end
  end
end
