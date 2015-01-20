require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :concert do
    sequence(:concert_date) { |n| "1/#{n}/1995" }
    sequence(:id) { |n| n }
    state 'VT'
    city 'Burlington'
    venue 'Flynn Theatre'
  end

  factory :prediction do
    set_one_opener_song_id '123'
    set_one_closer_song_id '234'
    set_two_opener_song_id '456'
    set_two_closer_song_id '567'
    encore_song_id '564'
    random_pick_song_id '321'

    concert
  end
end
