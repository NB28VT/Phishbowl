require 'rails_helper'

RSpec.describe SongLoader, :type => :model do
  it "Scrapes Phish.net for a list of songs and enters them into the database" do
    initial_song_count = Song.count

    loader = SongLoader.new
    song_hash = loader.load_song_table

    song_hash.each do |song_data|
      song = Song.find_or_initialize_by(song_name: song_data[0])
      song.artist_name = song_data[1]["artist"]
      song.song_gap = song_data[1]["gap"]
      song.song_name = song_data[0]
      song.save!
    end

    expect(Song.count).to be > initial_song_count
  end
end
