# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
director = Director.create!(name: 'Someone!')
movie2 = director.movies.create!(title: 'Something Exceptional', description: 'Just kidding', rating: 5)
director = Director.create!(name: 'Someone Else')
movie1 = director.movies.create!(title: 'Shawshank Redemption', description: 'Tim Robbins in jail')
movie2 = director.movies.create!(title: 'Mary Poppins', description: 'Tim Robbins in jail')
@genre1 = movie1.genres.create!(name: 'Sci-fi')
@genre2 = movie2.genres.create!(name: 'Action')
sci_fi = movie1.genres.create!(name: 'Romance')
MovieGenre.create(movie_id: movie2.id, genre_id: sci_fi.id)
admin = User.create!(username: 'jerrel', password: 'password', role: 1)
