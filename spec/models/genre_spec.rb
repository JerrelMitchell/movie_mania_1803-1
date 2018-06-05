require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:name)}
  end
  describe 'relationships' do
    it { should have_many(:movie_genres)}
    it { should have_many(:movies)}
  end

  describe 'methods' do
    it 'has #average_movie_rating for all movies of a genre' do
      director = Director.create!(name: 'Someone!')
      movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail', rating: 3)
      movie2 = director.movies.create!(title: 'Something Exceptional', description: 'Just kidding')
      rando = movie1.genres.create!(name: 'Randoname')
      not_so_rando = movie2.genres.create!(name: 'not_so_Randoname')
      # test not allowing me to add in another movie with same category on model level. constant validation of uniqueness errors even after dropping database


      expect(rando.average_movie_rating.to_f.round(2)).to eq(3)
      expect(not_so_rando.average_movie_rating.to_f.round(2)).to eq(0)
    end

    it 'has #highest_movie_rating for all movies of a genre' do
      director = Director.create!(name: 'Someone!')
      movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail', rating: 3)
      movie2 = director.movies.create!(title: 'Something Exceptional', description: 'Just kidding')
      rando = movie1.genres.create!(name: 'Randoname')
      not_so_rando = movie2.genres.create!(name: 'not_so_Randoname')
      # test not allowing me to add in another movie with same category on model level. constant validation of uniqueness errors even after dropping database


      expect(rando.highest_movie_rating).to eq(3)
      expect(not_so_rando.highest_movie_rating).to eq(0)
    end
  end
end
