require 'httparty'

class IGDB
  include HTTParty
  base_uri 'https://api.igdb.com/v4'

  def initialize
    @client_id = ENV['CLIENT_ID']
    @client_secret = ENV['CLIENT_SECRET']
    @access_token = get_access_token
    @token_expiry = Time.now + 3600  # Token expires in 1 hour
  end

  def get_access_token
    response = HTTParty.post('https://id.twitch.tv/oauth2/token', body: {
      client_id: @client_id,
      client_secret: @client_secret,
      grant_type: 'client_credentials'
    })

    raise "Failed to get access token" unless response.code == 200

    @token_expiry = Time.now + response['expires_in']
    response['access_token']
  end

  def query(endpoint, body)
    refresh_access_token if Time.now > @token_expiry

    self.class.post(endpoint,
      headers: {
        'Client-ID' => @client_id,
        'Authorization' => "Bearer #{@access_token}"
      },
      body: body
    )
  end

  private

  def refresh_access_token
    @access_token = get_access_token
  end
end
