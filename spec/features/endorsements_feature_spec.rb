require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user =  User.create email: 'test@test.com', password: '123456'
    kfc = Restaurant.create(name: 'KFC', user_id: user.id)
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination', restaurant_id: kfc.id, user_id: user.id)
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    visit '/restaurants'
    click_link 'Endorse Review' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    visit '/restaurants'
    10.times{click_link 'Endorse Review'} #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('10 endorsements')
  end

end
