class UpcomingShowLoader
  attr_reader :api_call

  def initialize
    @api_call = "https://api.phish.net/api.js?api=2.0&method=pnet.shows.upcoming&format=json"
  end


  def web_request(api_call)
    begin
      HTTParty.get(api_call)
    rescue HTTParty::Error
      return false
    end
  end

  def upcoming_shows
    raw_concerts = web_request(@api_call)
    # List of concerts is an array
    # return raw_concerts
  end
end
