require "rails_helper"

RSpec.feature "As an admin" do
  scenario "they can create escapes" do

    admin = User.create(username: "iadmin", full_name: "colleen", address: "8408 S. Elwood Tulsa, OK 74132", password: "ipass",
    password_confirmation: "ipass", role: 1)

    category = Category.create(title: "outdoor")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_escape_path

    fill_in "escape[name]", with: "Rough Sunset"
    fill_in "escape[price]", with: 4500.00
    fill_in "escape[description]", with: "Ghengis Khan was here"
    fill_in "escape[city]", with: "Ulaanbaatar"
    fill_in "escape[image]", with: "url"

    select "outdoor", :from => 'escape[id]'

    click_on "Create Escape"


    expect(current_path).to eq(admin_escapes_path)
    expect(page).to have_content("Nice package!")
# - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)

  end
end
