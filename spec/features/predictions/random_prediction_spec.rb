require 'rails_helper'

#NEEDS A SERIOUS REFACTOR

feature "Prediction on show", %(
As a Phishead
I'd like to guess a setlist for a recent show
So that I can practice my prediction skills agains that show
Acceptance criteria
[x] The app can load a show onto the concert page
[x] A user can vist the prediction page for that show
[ ] A user can edit prediciton for a show

) do

  # REFACTOR TO LET BLOCK. ISSUES WITH PERSISTED DATA. WORK ON THIS
  # rake test run didn't work


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

    user = FactoryGirl.create(:user)

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

  scenario "A user gets an error for not filling out prediciton fields" do

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

    click_on "Submit Predictions"

    expect(page).to have_content ("ERROR!")
  end


  scenario "A user can edit predictions for a random show" do
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
    other_song = ConcertSong.last.song

    visit new_concert_prediction_path(concert)

    select(song.song_name, from: "Set One Opener")
    select(song.song_name, from: "Set One Closer")
    select(song.song_name, from: "Set Two Opener")
    select(song.song_name, from: "Set Two Closer")
    select(song.song_name, from: "Encore")
    select(other_song.song_name, from: "Random Pick")

    click_on "Submit Predictions"

    click_on "Edit"

    select(other_song.song_name, from: "Set One Opener")

    click_on "Submit Predictions"

    expect(page).to have_content (other_song.song_name)
  end

  scenario "A user can delete a prediction" do

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

    visit new_concert_prediction_path(concert)

    select(song.song_name, from: "Set One Opener")
    select(song.song_name, from: "Set One Closer")
    select(song.song_name, from: "Set Two Opener")
    select(song.song_name, from: "Set Two Closer")
    select(song.song_name, from: "Encore")
    select(song.song_name, from: "Random Pick")

    click_on "Submit Predictions"

    initial_prediction_count = Prediction.count

    click_on "Delete"

    expect(Prediction.count).to eq(initial_prediction_count - 1)
  end
end
