class DashboardController < ApplicationController
  def index
    concert = RandomConcertGenerator.new
    @random_concert = concert.generate_random_concert
    concert_loader = ConcertLoader.new
    @latest_setlist = concert_loader.concert_builder("https://api.phish.net/api.json?api=2.0&method=pnet.shows.setlists.latest")
  end
end
