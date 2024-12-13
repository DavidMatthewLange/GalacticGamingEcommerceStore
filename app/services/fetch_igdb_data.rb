class FetchIgdbData
  def self.fetch_star_wars_games(page = 1, per_page = 20)
    igdb = IGDB.new
    offset = (page - 1) * per_page

    body = <<~GRAPHQL
      fields name, first_release_date, summary, cover.url, platforms.name, genres.name, developer, rating;
      where name ~ "Star Wars*";
      offset #{offset};
      limit #{per_page};
    GRAPHQL

    # Fetching data and returning the response
    response = igdb.query("/games", body)

    # For debugging, check the response structure
    puts response.inspect # This will print the response structure in your terminal.

    # Returning the data or an empty array if no data found
    response["data"] || []
  end

  def self.fetch_consoles
    igdb = IGDB.new
    body = <<~GRAPHQL
      fields name, manufacturer, release_date, summary, cover.url;
      where category = 1;
      limit 50;
    GRAPHQL

    # Fetching platform data
    response = igdb.query("/platforms", body)

    # Returning the data
    response["data"] || []
  end
end
