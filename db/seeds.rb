Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", city: "Denver", price: 200.00, image: "gentle_dawn.jpg")

Escape.create(name: "Basement Dweller", description: "Enjoy the fluorescent lighting!", city: "Denver", price: 1.00, image: "basement_dweller.jpg")

Category.create(title: "Outdoors")
Category.create(title: "Indoors")

EscapeCategory.create(category_id: 1, escape_id: 1)
EscapeCategory.create(category_id: 2, escape_id: 2)

User.create(username: "booradley", password: "asecretpassword", password_confirmation: "asecretpassword")
User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1)
<<<<<<< HEAD
=======

>>>>>>> 32d48abfa9e96a862f30ea857c005647a7586f66


User.first.orders.create(status: "paid", total: 200.00)
User.first.orders.create(status: "completed", total: 202.00)

User.last.orders.first.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)
User.last.orders.last.order_escapes.create(escape_id: Escape.last.id, quantity: 2, total: 2.00)
User.last.orders.last.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)

puts "Seeds Updated! Nice work team..."
