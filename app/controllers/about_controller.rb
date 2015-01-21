class AboutController < ApplicationController
  def index
    concert_loader = ConcertLoader.new
    @latest_setlist = concert_loader.concert_builder(
    "https://api.phish.net/api.json?api=2.0&method=pnet.shows.setlists.latest"
    )
  end
end
