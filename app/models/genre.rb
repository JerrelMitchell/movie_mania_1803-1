class Genre < ApplicationRecord
  validates :name, uniqueness: true
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  def average_movie_rating
    movies.average(:rating)
  end

  def highest_movie_rating
    movies.maximum(:rating)
  end
end
