require 'rails_helper'



feature 'view homepage' do

  context 'as a visitor' do
    scenario 'I want to see the home page' do
      visit root_path
      expect(page).to have_content('Brau Meister')
    end

    scenario 'I want to be able to sign in' do
      visit root_path
      expect(page).to have_content('Sign In')
    end

    scenario 'I want to be able to see public recipes' do
      visit root_path
      expect(page).to have_content('Public Recipes')
    end
  end

  context 'as an authenticated user' do
    before(:each) do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end
    
    scenario 'I want to be able to make a recipe' do

      visit root_path
      expect(page).to have_content('Recipe Maker')
      expect(page).to have_content('Sign Out')
    end

    scenario 'I want to be able to see public recipes and my recipes' do
      visit root_path
      expect(page).to have_content('Your Recipes')
      expect(page).to have_content('Public Recipes')
    end
  end
end
