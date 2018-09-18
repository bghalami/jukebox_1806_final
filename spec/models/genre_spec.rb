require "rails_helper"

describe Genre, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it {should have_many(:songs)}
    it {should have_many(:genre_songs)}
  end
  describe "methods" do
    describe "#average_rating" do
      it "should return the average rating of all songs under genre" do
        artist_1 = Artist.create(name: "Rick James")
        artist_2 = Artist.create(name: "Vanilla Ice")

        song_1 = artist_1.songs.create!( title: 'Superfreak',
                                        length: 300,
                                        play_count: 5000000,
                                        artist: artist_1
                                      )
        song_2 = artist_1.songs.create!( title: 'Superfreak 2',
                                        length: 200,
                                        play_count: 10000,
                                        artist: artist_2,
                                        rating: 3
                                      )
        song_3 = artist_2.songs.create!( title: 'Ice Ice Baby',
                                        length: 200,
                                        play_count: 10000,
                                        artist: artist_2,
                                        rating: 3
                                      )
        genre = Genre.create(name: "Freaks")

        genre.songs << song_1
        genre.songs << song_3

        expect(genre.average_rating).to eq(2)
      end
    end
  end
end
