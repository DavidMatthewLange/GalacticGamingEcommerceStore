class FetchIGDBData
  def self.fetch_star_wars_games(page = 1, per_page = 20)
    igdb = IGDB.new
    offset = (page - 1) * per_page

    body = <<~GRAPHQL
      fields name, release_date, summary, cover.url, platforms.name, genres.name, developer, rating;
      where name ~ "Star Wars*";
      offset #{offset};
      limit #{per_page};
    GRAPHQL

    igdb.query("/games", body)
  end

  results
end

def self.fetch_consoles
  igdb = IGDB.new
  body = <<~GRAPHQL
    fields name, manufacturer, release_date, summary, cover.url;
    where category = 1;
    limit 50;
  GRAPHQL
  igdb.query("/platforms", body)
end
