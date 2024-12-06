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
# AdminUser.delete_all


# Create categories and platforms
platform = Platform.find_or_create_by!(name: "PlayStation", manufacturer: "Sony", release_date: "1994-11-12")
platform = Platform.find_or_create_by!(name: "PlayStation 2", manufacturer: "Sony", release_date: "2000-03-01")
platform = Platform.find_or_create_by!(name: "PlayStation 3", manufacturer: "Sony", release_date: "2006-11-12")
platform = Platform.find_or_create_by!(name: "PlayStation 4", manufacturer: "Sony", release_date: "2013-11-12")
platform = Platform.find_or_create_by!(name: "PlayStation 5", manufacturer: "Sony", release_date: "2020-11-12")
platform = Platform.find_or_create_by!(name: "Xbox", manufacturer: "Microsoft", release_date: "2001-11-01")
platform = Platform.find_or_create_by!(name: "Xbox 360", manufacturer: "Microsoft", release_date: "2005-11-12")
platform = Platform.find_or_create_by!(name: "Xbox One", manufacturer: "Microsoft", release_date: "2013-11-12")
platform = Platform.find_or_create_by!(name: "Xbox Series X/S", manufacturer: "Microsoft", release_date: "2020-11-12")
platform = Platform.find_or_create_by!(name: "Nintendo Entertainment System", manufacturer: "Nintendo", release_date: "1985-10-01")
platform = Platform.find_or_create_by!(name: "Super Nintendo Entertainment System", manufacturer: "Nintendo", release_date: "1991-08-01")
platform = Platform.find_or_create_by!(name: "Nintendo 64", manufacturer: "Nintendo", release_date: "1996-09-01")
platform = Platform.find_or_create_by!(name: "Nintendo GameCube", manufacturer: "Nintendo", release_date: "2001-09-01")
platform = Platform.find_or_create_by!(name: "Nintendo Wii", manufacturer: "Nintendo", release_date: "2006-11-01")
platform = Platform.find_or_create_by!(name: "Nintendo Switch", manufacturer: "Nintendo", release_date: "2017-11-01")

category = Category.find_or_create_by!(name: "Action", description: "Action games")
category = Category.find_or_create_by!(name: "Adventure", description: "Adventure games")
category = Category.find_or_create_by!(name: "Sports", description: "Sports games")
category = Category.find_or_create_by!(name: "Simulation", description: "Simulation games")
category = Category.find_or_create_by!(name: "Role-Playing", description: "Role-playing games")
category = Category.find_or_create_by!(name: "FPS", description: "First person shooter games")
category = Category.find_or_create_by!(name: "Fighting", description: "Fighting games")
category = Category.find_or_create_by!(name: "RTS", description: "Real-time strategy games")
category = Category.find_or_create_by!(name: "Racing", description: "Racing games")
category = Category.find_or_create_by!(name: "Puzzle", description: "Puzzle games")
category = Category.find_or_create_by!(name: "MMORPG", description: "Massive multiplayer online role playing games")
category = Category.find_or_create_by!(name: "Party", description: "Party games")
category = Category.find_or_create_by!(name: "Survival", description: "Survival games")
category = Category.find_or_create_by!(name: "Battle Royale", description: "Battle Royale games")

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

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
