require 'rails_helper'

RSpec.feature "As admin" do
  scenario "they can log in" do

  User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1)
 
  visit login_path
  fill_in "session[username]", with: "iadmin"
  fill_in "session[password]", with: "ipass"

  click_on "Log In"

  expect(current_path).to eq(admin_dashboard_path)
  expect(page).to have_content("ADMIN Dashboard")

  end
end