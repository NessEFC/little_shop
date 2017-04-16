require 'rails_helper'

RSpec.feature "As a logged-in user," do
  scenario "they can view a single order's show page" do

    user = create(:user)
    order = user.orders.create(status: "completed", total: 500.00)
    escape = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 500.00, city: "San Diago", image: "url")
    order_escape = user.orders.first.order_escapes.create(escape_id: escape.id, quantity: 1, total: 500.00)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content("Order #1")
    expect(page).to have_content("April 16, 2017")

    click_on("View Order")

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(escape.name)
    expect(page).to have_content(order_escape.quantity) 
    expect(page).to have_link("Gentle Dawn")
    expect(page).to have_content(order.status)
    expect(page).to have_content(order_escape.total)
    expect(page).to have_content(order.format_created_at)
    expect(page).to have_content("#{order.status} on #{order.format_updated_at}")
  end
end
