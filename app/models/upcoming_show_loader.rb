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

  def json_parser(raw_concert)
    begin
      JSON.parse(raw_concert)
    rescue JSON::JSONError
      return false
    end
  end

  def concert_loader
    raw_concert = web_request(@api_call)
    jsoned = json_parser(raw_concert)
    return jsoned
  end

end
