require 'rails_helper'

describe "visitor sees one genre" do
  it "visitor sees all movies under that genre" do
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

  it 'sees average movie rating of this genre' do
    director = Director.create!(name: 'Someone!')
    movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail', rating: 3)
    movie2 = director.movies.create!(title: 'Something Exceptional', description: 'Just kidding', rating: 5)
    sci_fi = movie1.genres.create!(name: 'Sci-fi')
    MovieGenre.create(movie_id: movie2.id, genre_id: sci_fi.id)


    visit genre_path(sci_fi)

    expect(page).to have_content(sci_fi.average_movie_rating)
  end
end
