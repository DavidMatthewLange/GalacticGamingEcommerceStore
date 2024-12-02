# Data for testing purposes....
# db/seeds.rb

OrderItem.delete_all
Order.delete_all
ProductCategory.delete_all
ProductPlatform.delete_all
Product.delete_all
Category.delete_all
Platform.delete_all
User.delete_all
AdminUser.delete_all


# Create categories and platforms
category = Category.find_or_create_by!(name: "Action", description: "Action games")
platform = Platform.find_or_create_by!(name: "PlayStation 5", manufacturer: "Sony", release_date: "2020-11-12")

# Create a user
user = User.find_or_create_by!(name: "John Doe", email: "johndoe@example.com", password: "password", role: "customer")

# Create a product with associations
product = Product.create!(
  name: "Star Wars: Jedi Survivor",
  description: "A thrilling action game",
  price: 59.99,
  stock_qty: 100,
  categories: [ category ],
  platforms: [ platform ]
)

# Create an order and order item
order = Order.create!(user: user, status: "pending", total_price: 59.99)
OrderItem.create!(quantity: 1, unit_price: 59.99, tax_rate: 0.07, order: order, product: product)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
