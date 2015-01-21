class RandomConcertGenerator

  def pull_random_concert_from_database
    random_id = rand(Concert.count) + 1
    rand_record = Concert.where(id: random_id).first
  end

  def generate_random_concert
    new_concert = ConcertLoader.new
    new_concert.concert_builder(
      "https://api.phish.net/api.json?api=2.0&method=pnet.shows.setlists.random"
    )
  end
end
