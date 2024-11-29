# Data for testing purposes....
# db/seeds.rb
user = User.create!(name: "John Doe", email: "johndoe@example.com", password: "password", role: "customer")

category = Category.create!(name: "Action", description: "Action games")
platform = Platform.create!(name: "PlayStation 5", manufacturer: "Sony", release_date: "2020-11-12")

product = Product.create!(name: "Star Wars: Jedi Survivor", description: "A thrilling action game", price: 59.99, stock_qty: 100, category: category, platform: platform)

order = Order.create!(user: user, status: "pending", total_price: 59.99)

order_item = OrderItem.create!(quantity: 1, unit_price: 59.99, tax_rate: 0.07, order: order, product: product)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?