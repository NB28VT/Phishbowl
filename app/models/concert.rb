class Concert < ActiveRecord::Base
  has_many :predictions
  has_many :concert_songs
  has_many :songs,
    through: :concert_songs

  validates :concert_date, uniqueness: true
end
