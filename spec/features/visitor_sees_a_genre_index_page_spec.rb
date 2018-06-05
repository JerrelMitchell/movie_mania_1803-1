require 'rails_helper'

describe "visits categories index page" do
  before(:each) do
    director = Director.create!(name: 'Someone!')
    movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail')
    movie2 = director.movies.create!(title: 'Mary Poppins', description: 'Tim Robbins in jail')
    @genre1 = movie1.genres.create!(name: 'Sci-fi')
    @genre2 = movie2.genres.create!(name: 'Action')
  end
  context "as visitor" do
    it "allows visitor to see all genres" do

      visit genres_path

      expect(page).to_not have_content("Create New Genre")

      expect(page).to have_content("All Genres")
      expect(page).to have_link(@genre1.name)
      expect(page).to have_link(@genre2.name)
    end
  end
end
