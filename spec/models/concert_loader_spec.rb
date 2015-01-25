require 'rails_helper'

RSpec.describe ConcertLoader, :type => :model do

  it "loads a recent show into the database" do
    loader = SongLoader.new
    song_hash = loader.load_song_table

    song_hash.each do |song_data|
      song = Song.find_or_initialize_by(song_name: song_data[0])
      song.artist_name = song_data[1]["artist"]
      song.song_gap = song_data[1]["gap"]
      song.song_name = song_data[0]
      song.save!
    end

    initial_concert_count = Concert.count

    concert_loader = ConcertLoader.new
    concert_loader.concert_builder(
    "https://api.phish.net/api.json?api=2.0&method=pnet.shows.setlists.latest"
    )

    expect(Concert.count).to eq(initial_concert_count + 1)
  end
end
