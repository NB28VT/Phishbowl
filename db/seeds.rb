loader = SongLoader.new
song_hash = loader.load_song_table

song_hash.each do |song_data|
  song = Song.find_or_initialize_by(song_name: song_data[0])
  song.artist_name = song_data[1]["artist"]
  song.song_gap = song_data[1]["gap"]
  song.song_name = song_data[0]
  song.save!
end

# 10.times do
#   puts "Loading random concerts into database"
#   begin
#     concert = RandomConcertGenerator.new
#     @random_concert = concert.generate_random_concert
#   rescue PG::Error
#     puts "ERROR"
#     retry
#   end
#   sleep(120)
# end
