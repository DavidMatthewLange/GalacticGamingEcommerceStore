class FetchIgdbData
  def self.fetch_star_wars_games
    igdb = IGDB.new

    body = <<~GRAPHQL
      fields name, summary, cover.url, platforms.name, genres.name;
      limit 100;
    GRAPHQL

    # where name ~ "Star Wars*";

    # Fetching data and returning the response
    response = igdb.query("/games", body)

    Rails.logger.debug "Response Data: #{response.inspect}"

    response
  end

  def self.fetch_consoles
    igdb = IGDB.new
    body = <<~GRAPHQL
      fields name, summary;
      where category = 1;
      limit 50;
    GRAPHQL

    # Fetching platform data
    response = igdb.query("/platforms", body)

    Rails.logger.debug "Response Data: #{response.inspect}"

    response
  end
end
