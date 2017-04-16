require 'rails_helper'

RSpec.feature "As admin" do
  scenario "they can modify account data" do
    admin = User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_dashboard_path

     click_on "Edit"

     expect(current_path).to eq(edit_admin_user_path(admin))

     fill_in "user[username]", with: "admin"

     click_on "Edit Account"
     
     expect(current_path).to eq(admin_dashboard_path)
     expect(page).to have_content("Username: admin")
     
    # As a logged in Admin
    # I can modify my account data
  end
end
