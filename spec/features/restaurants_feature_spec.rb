require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      sign_up
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end

feature 'When user signed in' do
  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      sign_up
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'an invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      sign_up
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

  context 'viewing restaurants' do
      scenario 'let a user view a restaurant' do
        create_restaurant
        visit '/restaurants'
        click_link 'KFC'
        expect(page).to have_content 'KFC'
      end
  end

  context 'editing restaurants' do
    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      create_restaurant
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      fill_in 'Description', with: 'Deep fried goodness'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'Deep fried goodness'
      expect(current_path).to eq '/restaurants'
    end

    scenario 'removes a restaurant when a user clicks a delete link'do
      create_restaurant
      click_link 'Delete'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

  scenario 'displays an average rating for all reviews' do
    create_restaurant
    leave_review('So so', '3')
    sign_out
    sign_up2
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end

end
