require 'rails_helper'

RSpec.describe PredictionCalculator, :type => :model do

  it "Calculates a prediction score for maximum points and returns song in right place" do
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
      set_one_opener_song_id: set_one_opener.song_id,
      set_one_closer_song_id: set_one_closer.song_id,
      set_two_opener_song_id: set_two_opener.song_id,
      set_two_closer_song_id: set_two_closer.song_id,
      encore_song_id: encore.song_id,
      random_pick_song_id: random_song_one.song_id,
      concert_id: concert.id
      )

    calculator = PredictionCalculator.new

    expect(calculator.get_prediction_score(prediction)).to eq(17)
    expect(calculator.correct_songs).to include(set_one_opener.song.song_name)
  end
end
