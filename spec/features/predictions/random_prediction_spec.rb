require 'rails_helper'


feature "Prediction on random show", %(
As a Phishead
I'd like to guess a setlist for a random show
So that I can practice my prediction skills agains that show
Acceptance criteria
[ ] The app can load a random show onto the show page
[ ] A user can vist the prediction page for that show


) do


  scenario "A user can check predictions against a random show" do

    user = FactoryGirl.create(:user)

    concert = FactoryGirl.create(:concert)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 1, play_index: 1)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 1, play_index: 2)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 1, play_index: 3)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 2, play_index: 1)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 2, play_index: 2)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 2, play_index: 3)
    FactoryGirl.create(:concert_song, concert_id: concert.id, set_index: 3, play_index: 1)


    song = ConcertSong.first.song

    sign_in_as(user)

    visit new_concert_prediction_path(concert)

    select(song.song_name, from: "Set One Opener")
    select(song.song_name, from: "Set One Closer")
    select(song.song_name, from: "Set Two Opener")
    select(song.song_name, from: "Set Two Closer")
    select(song.song_name, from: "Encore")
    select(song.song_name, from: "Random Pick")

    click_on "Submit Predictions"

    click_on "Check Score"

    expect(page).to have_content ("Your score was")
  end


  # scenario "A user can edit predictions for a random show" do
  #   user = FactoryGirl.create(:user)
  #
  #   prediction = FactoryGirl.create(:prediction)
  #
  #   sign_in_as(user)
  #
  #   visit concert_path(prediction.concert)
  #
  #   click_on "Edit"
  #
  #   select('A Song I Heard the Ocean Sing', from: "Set One Opener")
  #   select("Kill Devil Falls", from: "Set One Closer")
  #   select("Golden Age", from: "Set Two Opener")
  #   select("Harry Hood", from: "Set Two Closer")
  #   select("Harry Hood", from: "Encore")
  #   select("Free", from: "Random Pick")
  #
  #   click_on "Submit Predictions"
  #
  #   expect(page).to have_content ("A Song I Heard the Ocean Sing")
  # end
end
