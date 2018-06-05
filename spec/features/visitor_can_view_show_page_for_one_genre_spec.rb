require 'rails_helper'

describe "user sees one movie" do
  it "user sees one with title and description" do
    director = Director.create!(name: 'Someone!')
    movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail')
    movie2 = director.movies.create!(title: 'Something Exceptional', description: 'Just kidding')
    sci_fi = movie1.genres.create!(name: 'Sci-fi')
    MovieGenre.create(movie_id: movie2.id, genre_id: sci_fi.id)


    visit genre_path(sci_fi)

    expect(page).to have_content(sci_fi.name)
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
  end
end
