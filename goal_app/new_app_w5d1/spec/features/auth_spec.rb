require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end

  scenario 'has a user signup page' do
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      creds = { username: Faker::Superhero.name, password: Faker::Superhero.power }
      fill_in 'Username', with: creds[:username]
      fill_in 'Password', with: creds[:password]
      click_button 'Sign Up'

      expect(page).to have_content(creds[:username])
      expect(current_path).to eq(user_path(User.last))
    end
  end
end

feature 'logging in' do
  before :each do
    visit new_session_path
  end

  scenario 'shows username on the homepage after login' do
    creds = { username: Faker::Superhero.name, password: Faker::Superhero.power }
    user = User.create!(creds)

    fill_in 'Username', with: creds[:username]
    fill_in 'Password', with: creds[:password]
    click_button 'Sign In'

    expect(page).to have_content(creds[:username])
    expect(current_path).to eq(user_path(user))
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
