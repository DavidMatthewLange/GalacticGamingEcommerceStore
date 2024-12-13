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
    image_url:    platform_data.dig("cover", "url"), # Use dig to safely access nested data
    summary:      platform_data["summary"]
  )
end

# Create categories
games_data.each do |game|
  game["genres"].each do |genre|
    next unless genre && genre["name"] # Skip if genre or genre name is nil

    Category.find_or_create_by!(
      name:        genre["name"],
      description: "#{genre['name']} games"
    )
  end
end

# Create products with dynamic categories
games_data.each do |game|
  # Safely access platforms and genres
  game_platforms = game["platforms"].to_a.map do |platform_data|
    next unless platform_data && platform_data["name"] # Skip invalid platform data

    Platform.find_or_create_by!(name: platform_data["name"])
  end.compact

  game_categories = game["genres"].to_a.map do |genre|
    next unless genre && genre["name"] # Skip invalid genre data

    Category.find_or_create_by!(name: genre["name"])
  end.compact

  product = Product.create!(
    name:        game["name"],
    description: game["summary"],
    image_url:   game["cover"] ? game["cover"]["url"] : nil,
    price:       Faker::Commerce.price(range: 1.00..100.00),
    stock_qty:   Faker::Number.between(from: 1, to: 100),
    categories:  game_categories,
    platforms:   game_platforms
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
