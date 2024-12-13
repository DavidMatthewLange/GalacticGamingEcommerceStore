class FetchIGDBData
  def self.fetch_star_wars_games
    igdb = IGDB.new
    results = []
    offset = 0

    loop do
      body = <<~GRAPHQL
        fields name, cover.url, summary, platforms.name, genres.name;
        where name ~ "Star Wars*";
        offset #{offset};
        limit 50; # Fetch 50 at a time
      GRAPHQL

      response = igdb.query("/games", body)
      break if response.empty?

      results.concat(response)
      offset += 50
    end

    results
  end

  def self.fetch_consoles
    igdb = IGDB.new
    body = <<~GRAPHQL
      fields name;
      where category = 1; # Category 1 refers to consoles
      limit 50;
    GRAPHQL
    igdb.query("/platforms", body)
  end
end
