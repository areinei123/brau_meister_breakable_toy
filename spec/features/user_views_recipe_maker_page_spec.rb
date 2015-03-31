require 'rails_helper'

feature 'view recipe maker' do
  context 'as a signed in user' do
	  user = FactoryGirl.create(:user)
	visit new_user_session_path

	fill_in 'Email', with: user.email
	fill_in 'Password', with: user.password

	click_button 'Log in'

	scenario 'I want to view the Recipe Maker page' do
	  visit root
	  click_button 'Recipe Maker'

	  expect(page).to have_content('Hello, welcome to the Recipe Maker')
	end

	scenario 'I want to be able to name my recipe, so I know which recipe I am looking at' do
	  visit '/recipes/new'
	  expect(page).to have_content('Recipe title:')
	end

	scenario 'I want to be able to add grains, hops, and a yeast to my recipe' do
	  visit '/recipes/new'
	  expect(page).to have_content('Grains')
	  expect(page).to have_content('Hops')
	  expect(page).to have_content('Yeast')
	end
  end
end
