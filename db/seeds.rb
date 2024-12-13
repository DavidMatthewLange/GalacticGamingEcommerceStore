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

# Fetching data from API
games_data = FetchIgdbData.fetch_star_wars_games
platforms_data = FetchIgdbData.fetch_consoles

# Create platforms from console API data
platforms_data.each do |platform_data|
  Platform.find_or_create_by!(
    name:         platform_data["name"],
    manufacturer: platform_data["manufacturer"],
    release_date: platform_data["release_date"],
    image_url:    platform_data.dig("cover", "url"),
    summary:      platform_data["summary"]
  )
end

# Create categories
games_data.each do |game|
  game["genres"].each do |genre|
    Category.find_or_create_by!(
      name:        genre["name"],
      description: "#{genre['name']} games"
    )
  end
end

# Create a sample user
user = User.find_or_create_by!(name: "David Lange", email: "david.m.lange@outlook.com",
                               password: "testingPass", role: "customer")

# Create products with dynamic categories

games_data.each do |game|
  game_platforms = game["platforms"].map do |platform_data|
    Platform.find_or_create_by!(name: platform_data["name"])
  end
  game_categories = game["genres"].map do |genre|
    Category.find_or_create_by!(name: genre["name"])
  end.compact

  product = Product.create!(
    name:         game["name"],
    description:  game["summary"],
    image_url:    game["cover"] ? game["cover"]["url"] : nil,
    release_date: game["first_release_date"] ? Time.at(game["first_release_date"]).to_date : nil,
    developer:    game["developer"],
    rating:       game["rating"],
    price:        Faker::Commerce.price(range: 1.00..100.00),
    stock_qty:    Faker::Number.between(from: 1, to: 100),
    categories:   game_categories,
    platforms:    game_platforms
    # categories:  [category],
    # platforms:   [platform]
  )
end

# Create an order and order item
order = Order.create!(user: user, status: "pending", total_price: 59.99)
OrderItem.create!(quantity: 1, unit_price: 59.99, tax_rate: 0.07, order: order, product: product)

# AdminUser.create!(email: 'admin@example.com', password: 'password',
# password_confirmation: 'password') if Rails.env.development?

# StaticPage.create!(title: "About",
# content: "This is the About page content.", slug: "about")

# StaticPage.create!(title: "Contact",
# content: "This is the Contact page content.", slug: "contact")
