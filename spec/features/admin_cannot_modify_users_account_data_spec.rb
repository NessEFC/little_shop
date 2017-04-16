require 'rails_helper'

RSpec.feature "As admin" do
  scenario "they can't modify users account data" do
    user = User.create(username: "John", password: "pass", password_confirmation: "pass")
    admin = User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit "/admin/users/1/edit"

     expect(page).to have_content("You cannot modify any other user's account data")
  end
end