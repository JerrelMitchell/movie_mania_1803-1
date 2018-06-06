class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @genre_movies = @genre.movies
    @genre_average_rating = @genre.average_movie_rating
    @genre_highest_rating = @genre.highest_movie_rating
    @genre_lowest_rating = @genre.lowest_movie_rating
  end

  private

    def genres_params
      params.require(:genre).permit(:name)
    end
end
