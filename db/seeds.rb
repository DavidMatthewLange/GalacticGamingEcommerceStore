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
Platform.find_or_create_by!(name: "PlayStation", manufacturer: "Sony",
                            release_date: "1994-11-12")
Platform.find_or_create_by!(name: "PlayStation 2", manufacturer: "Sony",
                            release_date: "2000-03-01")
Platform.find_or_create_by!(name: "PlayStation 3", manufacturer: "Sony",
                            release_date: "2006-11-12")
Platform.find_or_create_by!(name: "PlayStation 4", manufacturer: "Sony",
                            release_date: "2013-11-12")
Platform.find_or_create_by!(name: "PlayStation 5", manufacturer: "Sony",
                            release_date: "2020-11-12")
Platform.find_or_create_by!(name: "Xbox", manufacturer: "Microsoft",
                            release_date: "2001-11-01")
Platform.find_or_create_by!(name: "Xbox 360", manufacturer: "Microsoft",
                            release_date: "2005-11-12")
Platform.find_or_create_by!(name: "Xbox One", manufacturer: "Microsoft",
                            release_date: "2013-11-12")
Platform.find_or_create_by!(name: "Xbox Series X/S", manufacturer: "Microsoft",
                            release_date: "2020-11-12")
Platform.find_or_create_by!(name: "Nintendo Entertainment System",
                            manufacturer: "Nintendo", release_date: "1985-10-01")
Platform.find_or_create_by!(name: "Super Nintendo Entertainment System",
                            manufacturer: "Nintendo", release_date: "1991-08-01")
Platform.find_or_create_by!(name: "Nintendo 64", manufacturer: "Nintendo",
                            release_date: "1996-09-01")
Platform.find_or_create_by!(name: "Nintendo GameCube", manufacturer: "Nintendo",
                            release_date: "2001-09-01")
Platform.find_or_create_by!(name: "Nintendo Wii", manufacturer: "Nintendo",
                            release_date: "2006-11-01")
platform = Platform.find_or_create_by!(name: "Nintendo Switch", manufacturer: "Nintendo",
                                       release_date: "2017-11-01")

Category.find_or_create_by!(name: "Action", description: "Action games")
Category.find_or_create_by!(name: "Adventure", description: "Adventure games")
Category.find_or_create_by!(name: "Sports", description: "Sports games")
Category.find_or_create_by!(name: "Simulation", description: "Simulation games")
Category.find_or_create_by!(name: "Role-Playing", description: "Role-playing games")
Category.find_or_create_by!(name: "FPS", description: "First person shooter games")
Category.find_or_create_by!(name: "Fighting", description: "Fighting games")
Category.find_or_create_by!(name: "RTS", description: "Real-time strategy games")
Category.find_or_create_by!(name: "Racing", description: "Racing games")
Category.find_or_create_by!(name: "Puzzle", description: "Puzzle games")
Category.find_or_create_by!(name:        "MMORPG",
                            description: "Massive multiplayer online role playing games")
Category.find_or_create_by!(name: "Party", description: "Party games")
Category.find_or_create_by!(name: "Survival", description: "Survival games")
category = Category.find_or_create_by!(name: "Battle Royale", description: "Battle Royale games")

# Create a user
user = User.find_or_create_by!(name: "John Doe", email: "johndoe@example.com",
                               password: "p@55W04d", role: "customer")

# Create a product with associations
product = Product.create!(
  name:        "Star Wars: Jedi Survivor",
  description: "A thrilling action game",
  price:       59.99,
  stock_qty:   100,
  categories:  [category],
  platforms:   [platform]
)

# Create an order and order item
order = Order.create!(user: user, status: "pending", total_price: 59.99)
OrderItem.create!(quantity: 1, unit_price: 59.99, tax_rate: 0.07, order: order, product: product)

# AdminUser.create!(email: 'admin@example.com', password: 'password',
# password_confirmation: 'password') if Rails.env.development?

# StaticPage.create!(title: "About",
# content: "This is the About page content.", slug: "about")

# StaticPage.create!(title: "Contact",
# content: "This is the Contact page content.", slug: "contact")
