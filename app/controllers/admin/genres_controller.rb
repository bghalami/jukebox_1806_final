class Admin::GenresController < Admin::BaseController
  def create
    if current_user.role == "admin"
      Genre.create(genre_params)
      redirect_to genres_path
    else
      render ("/public/404")
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
