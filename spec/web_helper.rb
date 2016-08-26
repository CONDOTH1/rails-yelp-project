def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def sign_up2
  visit '/users/sign_up'
  fill_in 'Email', with: 'test2@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def log_in
  visit '/users/sign_in'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end

def create_restaurant
  sign_up
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
