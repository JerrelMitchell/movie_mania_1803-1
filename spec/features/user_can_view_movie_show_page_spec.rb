require 'rails_helper'

describe "user sees one movie" do
  it "user sees one with title and description" do
    director = Director.create(name: 'George Lucas')
    movie = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope')

    visit movie_path(movie.slug)

    expect(current_path).to eq("/movies/#{movie.slug}")

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end
  it 'sees genres listed only for this movie ' do
    director = Director.create(name: 'George Lucas')
    movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope')
    movie2 = director.movies.create(title:'Dude Wheres My Car', description: 'Dude')
    genre1 = movie1.genres.create!(name: 'Sci-fi')
    genre2 = movie1.genres.create!(name: 'Fiction')
    genre3 = movie2.genres.create!(name: 'Comedy')
    genre4 = movie2.genres.create!(name: 'Rom-Com')
    genre_message = "Genres for this Movie:"

    visit movie_path(movie1.slug)

    expect(page).to_not have_content(genre3.name)
    expect(page).to_not have_content(genre4.name)

    expect(page).to have_content(genre_message)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end

  it 'sees the number rating given to this movie' do
    director = Director.create(name: 'George Lucas')
    movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)

    visit movie_path(movie1.slug)

    expect(page).to have_content(movie1.rating)
  end
end
#
# As a Visitor,
#   When I visit a movie show page,
#     I see the number rating for this movie
#
# (the rating should be an integer attribute (from 1 to 5) for the movie)
