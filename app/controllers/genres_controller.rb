class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @songs = @genre.songs
    @average_rating = @genre.average_rating
  end

  def index
    @user = current_user
    @genres = Genre.all
    @genre = Genre.new
  end

end
