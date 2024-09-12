class ToggleTrackClient < ApplicationClient
  BASE_URI = "https://api.track.toggl.com/api/v9"

  def me
    get "/me"
  end

  def default_headers
    {
      "Authorization": "Basic #{Base64.encode64("#{token}:api_token")}"
    }
  end
end
