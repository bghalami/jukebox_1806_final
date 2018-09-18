class Genre < ApplicationRecord
  validates_presence_of :name

  has_many :genre_songs
  has_many :songs, through: :genre_songs

  def average_rating
    songs.average(:rating)
  end
end
