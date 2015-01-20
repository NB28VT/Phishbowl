require 'rails_helper'

# REFACTOR TO USE FACTORIES

# def concert_song_builder(song_name, play_index, set_index, new_show, songs_in_set)
#   ConcertSong.create(
#   song_id: Song.find_by(song_name: song_name).id,
#   play_index: play_index,
#   set_index: set_index,
#   concert_id: new_show.id,
#   songs_in_set: songs_in_set
#   )
# end
#
# def create_concert_songs(new_show)
#
#   first_set_songs = ["Harry Hood", "Suzy Greenberg", "David Bowie"]
#   second_set_songs = ["AC/DC Bag", "Run Like an Antelope", "Contact"]
#
#   play_index = 1
#   first_set_songs.each do |song|
#     concert_song_builder(song, play_index, 1, new_show, first_set_songs.count)
#     play_index += 1
#   end
#
#   play_index = 1
#   second_set_songs.each do |song|
#     concert_song_builder(song, play_index, 2, new_show, first_set_songs.count)
#     play_index += 1
#   end
#
#   # build encore song
#   concert_song_builder("Chalk Dust Torture", 1, 3, new_show, 1)
#
# end
#
# def create_concert_prediction(new_show)
#
#   Prediction.create(
#   user_id: 1,
#   concert_id: new_show.id,
#   set_one_opener_song_id: Song.find_by(song_name: "Harry Hood").id,
#   set_one_closer_song_id: Song.find_by(song_name: "David Bowie").id,
#   set_two_opener_song_id: Song.find_by(song_name: "AC/DC Bag").id,
#   set_two_closer_song_id: Song.find_by(song_name: "Contact").id,
#   encore_song_id: Song.find_by(song_name: "Chalk Dust Torture").id,
#   random_pick_song_id: Song.find_by(song_name: "Run Like an Antelope").id
#   )
#
# end


RSpec.describe PredictionCalculator, :type => :model do

  it "Calculates a prediction score for maximum points" do


    user = FactoryGirl.create(:user)

    concert = FactoryGirl.create(:concert)
    set_one_opener = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 1, play_index: 1)
    random_song_one = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 1, play_index: 2)
    set_one_closer = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 1, play_index: 3)
    set_two_opener = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 2, play_index: 1)
    random_song_two = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 2, play_index: 2)
    set_two_closer = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 2, play_index: 3)
    encore = FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 3, play_index: 1)

    prediction = FactoryGirl.create(:prediction,
      set_one_opener_song_id: set_one_opener.id,
      set_one_closer_song_id: set_one_closer.id,
      set_two_opener_song_id: set_two_opener.id,
      set_two_closer_song_id: set_two_closer.id,
      encore_song_id: encore.id,
      random_pick_song_id: random_song_one.id,
      concert_id: concert.id
      )

    calculator = PredictionCalculator.new

    expect(calculator.get_prediction_score(prediction)).to eq(17)
  end
end
