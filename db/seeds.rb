# Data for testing purposes....
# db/seeds.rb

OrderItem.delete_all
Order.delete_all
Product.delete_all
Platform.delete_all
Category.delete_all
User.delete_all
AdminUser.delete_all


category = Category.find_or_create_by!(name: "Action", description: "Action games")
platform = Platform.find_or_create_by!(name: "PlayStation 5", manufacturer: "Sony", release_date: "2020-11-12")

user = User.find_or_create_by!(name: "John Doe", email: "johndoe@example.com", password: "password", role: "customer")

product = Product.create!(name: "Star Wars: Jedi Survivor", description: "A thrilling action game", price: 59.99, stock_qty: 100, category_id: category.id, platform_id: platform.id)
product.categories << category
product.platforms << platform

order = Order.create!(user: user, status: "pending", total_price: 59.99)
order_item = OrderItem.create!(quantity: 1, unit_price: 59.99, tax_rate: 0.07, order: order, product: product)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
