require 'httparty'

class IGDB
  include HTTParty
  base_uri 'https://api.igdb.com/v4'

  def initialize
    @client_id = ENV['narijy08ftdm0giqoa3wn4ala6g313']
    @client_secret = ENV['9x9b2zimor5b2fh3aikjk8kz42xy0b']
    @access_token = get_access_token
  end

  def get_access_token
    response = HTTParty.post('https://id.twitch.tv/oauth2/token', body: {
      client_id: @client_id,
      client_secret: @client_secret,
      grant_type: 'client_credentials'
    })
    response['access_token']
  end

  def query(endpoint, body)
    self.class.post(endpoint,
      headers: {
        'Client-ID' => @client_id,
        'Authorization' => "Bearer #{@access_token}"
      },
      body: body
    )
  end
end
