class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @genre_movies = @genre.movies
    @genre_average_rating = @genre.average_movie_rating
  end
end
