require 'rails_helper'

feature 'Add ingredients to a recipe' do
  context 'As an authenticated user' do
    pending %{I want to be able to set the amount of water I want to be
    in my batch, so that I can make estimations about the OG and IBU.
    }do
      visit new_recipe_path
      fill_in 'Name', with: 'The Best Pale Ale'
      fill_in 'Batch size', with: '5'
      click_on 'Add Recipe'

      expect(page).to have_content('The Best Pale Ale')
    end

    pending %{I want to be able to have an estimated Original Gravity so that
    I can get a sense for how strong my beer might be
    } do
      visit new_recipe_path
      click_on 'Grains'
      page.select 'Pilsner (2 Row)', :from => 'Grain'
      fill_in 'Weight', with:'5'
      click_on 'Submit'
      page.select 'Light Dry', :from => 'Extract'
      fill_in 'Weight', with: '2.5'
      click_on 'Submit'
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
      click_on 'Submit'
      page.select 'Citra', :from => 'U.S.'
      fill_in 'Weight', with:'1.5'
      fill_in 'Time after boil', with: '30'
      click_on 'Submit'
      page.select 'Citra', :from => 'U.S.'
      fill_in 'Weight', with:'1.5'
      fill_in 'Time after boil', with: '45'
      click_on 'Submit'

      expect(page).to have_content('Estimated IBU:')
    end
  end
end