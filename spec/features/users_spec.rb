require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "user signs in" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: user.email
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "Sign up"

    expect(page).to have_content "Welcome!"

  end

  scenario "user signs in" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: user.email
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "Sign up"

    expect(page).to have_content "Welcome!"

    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."

  end

end
