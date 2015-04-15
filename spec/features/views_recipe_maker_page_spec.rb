require 'rails_helper'

feature 'view recipe maker' do
  context 'as an authenticated user' do
      let!(:user) { FactoryGirl.create(:user) }
      let!(:recipe) { FactoryGirl.create(:recipe) }

      before(:each) do  
        visit new_user_session_path

        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password

        click_button 'Log in'
      end
    scenario %{I want to view the recipe maker page} do
      visit root_path
      click_on 'Recipe Maker'

      expect(page).to have_selector(:link_or_button, 'Add Recipe')

    end

    scenario %{I want to be able to look at all
    the grains I can add to my recipe
    } do
      visit recipes_path
      click_on "New Stout"
      within("//li[@id='grain-tab']") do
        expect(page).to have_content('Grains')
        expect(page).to have_content('Extract')
        expect(page).to have_content('Adjunct')
        expect(page).to have_content('Sugar')
      end

    end

    scenario %{I want to be able to look at all the hops
    I can add to my recipe
    } do
      visit recipes_path
      click_on "New Stout"
      within("//li[@id='hop-tab']") do
        expect(page).to have_content('America')
        expect(page).to have_content('England')
        expect(page).to have_content('Australia')
        expect(page).to have_content('Germany')
        expect(page).to have_content('Czech Republic')
        expect(page).to have_content('Slovenia')
      end
    end

    scenario %{I want to be able to look at all the yeasts
    I can add to my recipe
    } do
      visit recipes_path
      click_on "New Stout"
      within("//li[@id='yeast-tab']") do
        expect(page).to have_content('Ale')
        expect(page).to have_content('Weisse')
        expect(page).to have_content('Lager')
        expect(page).to have_content('Belgian Ale')
        expect(page).to have_content('Sour')
      end
    end
  end
end
