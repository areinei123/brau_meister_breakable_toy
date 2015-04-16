require 'rails_helper'

feature 'Create new Recipe' do
  context 'As an authenticated user' do
    before(:each) do  

      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end

    scenario %{I want to be able to set the amount of water I want to be
    in my batch, as well as be able to set a Category.
    }do
      visit new_recipe_path
      fill_in 'Name', with: 'The Best Pale Ale'
      fill_in 'Batch size', with: '5'
      click_on 'Add Recipe'

      expect(page).to have_content('The Best Pale Ale')
    end
  end
end
