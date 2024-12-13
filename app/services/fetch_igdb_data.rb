class FetchIgdbData
  def self.fetch_star_wars_games(page = 1, per_page = 20)
    page = page.to_i
    per_page = per_page.to_i

    igdb = IGDB.new
    offset = (page - 1) * per_page

    body = <<~GRAPHQL
      fields name, summary, cover.url, platforms.name, genres.name;
      offset #{offset};
      limit #{per_page};
    GRAPHQL

    # where name ~ "Star Wars*";

    # Fetching data and returning the response
    response = igdb.query("/games", body)
    Rails.logger.debug("Raw Response: #{response.inspect}")

    # For debugging, check the response structure
    puts response.inspect # This will print the response structure in your terminal.

    # Returning the data or an empty array if no data found
    data = response["data"] || []
    Rails.logger.debug(data)
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
    data = response["data"] || []
  end
end
