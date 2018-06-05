require 'rails_helper'

describe "User visits genres index page" do
  before(:each) do
    director = Director.create!(name: 'Someone!')
    movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail')
    movie2 = director.movies.create!(title: 'Mary Poppins', description: 'Tim Robbins in jail')
    @genre1 = movie1.genres.create!(name: 'Sci-fi')
    @genre2 = movie2.genres.create!(name: 'Action')
  end
  context "as admin" do
    it "allows admin to see all genres" do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      expect(page).to have_content("Admin Genres")
      expect(page).to have_content(@genre1.name)
      expect(page).to have_content(@genre2.name)
    end

    it 'sees a form to create a new genre, and can create one' do
      new_genre = 'Romance'
      admin = User.create(username: "Dee", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_genres_path

      expect(page).to have_content("Create New Genre")

      fill_in :genre_name, with: new_genre
      click_on 'Create Genre'

      expect(current_path).to eq(admin_genres_path)
      expect(page).to have_content(new_genre)
    end
  end

  context "as default user" do
    it "does not allow default user to see admin genres index" do
      user = User.create(username: "Ian", password: "password123", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_genres_path

      expect(page).to_not have_content("Admin Genres")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
