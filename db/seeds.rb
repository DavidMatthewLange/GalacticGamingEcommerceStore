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

# Fetch the games data from the API
games_data = FetchIgdbData.fetch_star_wars_games

# Hard-coded platforms
platforms = [
  Platform.find_or_create_by!(name: "PlayStation 2", manufacturer: "Sony",
                              release_date: "2000-03-01"),
  Platform.find_or_create_by!(name: "PlayStation 3", manufacturer: "Sony",
                              release_date: "2006-11-12"),
  Platform.find_or_create_by!(name: "PlayStation 4", manufacturer: "Sony",
                              release_date: "2013-11-12"),
  Platform.find_or_create_by!(name: "PlayStation 5", manufacturer: "Sony",
                              release_date: "2020-11-12"),
  Platform.find_or_create_by!(name: "Xbox", manufacturer: "Microsoft", release_date: "2001-11-01"),
  Platform.find_or_create_by!(name: "Xbox 360", manufacturer: "Microsoft",
                              release_date: "2005-11-12"),
  Platform.find_or_create_by!(name: "Xbox One", manufacturer: "Microsoft",
                              release_date: "2013-11-12"),
  Platform.find_or_create_by!(name: "Xbox Series X/S", manufacturer: "Microsoft",
                              release_date: "2020-11-12"),
  Platform.find_or_create_by!(name: "Nintendo Entertainment System", manufacturer: "Nintendo",
                              release_date: "1985-10-01"),
  Platform.find_or_create_by!(name: "Super Nintendo Entertainment System",
                              manufacturer: "Nintendo", release_date: "1991-08-01"),
  Platform.find_or_create_by!(name: "Nintendo 64", manufacturer: "Nintendo",
                              release_date: "1996-09-01"),
  Platform.find_or_create_by!(name: "Nintendo GameCube", manufacturer: "Nintendo",
                              release_date: "2001-09-01"),
  Platform.find_or_create_by!(name: "Nintendo Wii", manufacturer: "Nintendo",
                              release_date: "2006-11-01"),
  Platform.find_or_create_by!(name: "Nintendo Switch", manufacturer: "Nintendo",
                              release_date: "2017-11-01")
]

# Predefined categories
categories = [
  "Adventure", "Sports", "Simulation", "Role-Playing", "FPS", "Fighting",
  "RTS", "Racing", "Puzzle", "MMORPG", "Party", "Survival", "Battle Royale"
]

categories.each do |category_name|
  Category.find_or_create_by!(name: category_name, description: "#{category_name} games")
end

products = []
# Create products with random categories and platforms
games_data.each do |game|
  # Select a random platform from the list of hardcoded platforms
  random_platform = platforms.sample

  # Select a random category from the predefined categories list
  random_category = Category.order(Arel.sql("RANDOM()")).first

  # Create the product with a random platform and category
  product = Product.create!(
    name:        game["name"],
    description: game["summary"],
    image_url:   game["cover"] ? game["cover"]["url"] : nil,
    price:       Faker::Commerce.price(range: 1.00..100.00),
    stock_qty:   Faker::Number.between(from: 1, to: 100),
    categories:  [random_category], # Assign the random category
    platforms:   [random_platform] # Assign the random platform
  )
  products << product
end

10.times do
  User.create!(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    role:     "customer"
  )
end

user = User.all.sample

# Create an order and order item
if products.any?
  product = products.sample
  order = Order.create!(user: user, status: "pending", total_price: 59.99)
  OrderItem.create!(quantity: 1, unit_price: 59.99, tax_rate: 0.07, order: order, product: product)
else
  puts "No products available."
end

# AdminUser.create!(email: 'admin@example.com', password: 'password',
# password_confirmation: 'password') if Rails.env.development?

# StaticPage.create!(title: "About",
# content: "This is the About page content.", slug: "about")

# StaticPage.create!(title: "Contact",
# content: "This is the Contact page content.", slug: "contact")
