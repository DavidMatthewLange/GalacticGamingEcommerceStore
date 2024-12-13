class FetchIgdbData
  def self.fetch_star_wars_games
    igdb = IGDB.new

    body = <<~GRAPHQL
      fields name, summary, cover.url, platforms.name;
      where franchises.name = "Star Wars";
      limit 100;
    GRAPHQL

    # where name ~ "Star Wars*";

    # Fetching data and returning the response
    response = igdb.query("/games", body)

    Rails.logger.debug "Response Data: #{response.inspect}"

    response
  end
end
