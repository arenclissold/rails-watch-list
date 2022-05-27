# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Movie.destroy_all if Rails.env == 'development'

url = 'https://tmdb.lewagon.com/movie/top_rated'

buffer = URI.open(url).read
data = JSON.parse(buffer)["results"]

data.each do |movie|
  Movie.create!(title: movie["title"],
                overview: movie["overview"],
                poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
                rating: movie["vote_average"])
end

List.destroy_all if Rails.env == 'development'

file = URI.open('https://cdn.vox-cdn.com/thumbor/OvN6ULKC1NPKDkB83UcZizJ7gp0=/298x0:2040x1360/1400x933/filters:focal(1173x361:1499x687):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/66869633/jbareham_200520_1021_ghibli_week_0001b.0.jpg')
article = List.new(name: 'Anime')
article.photo.attach(io: file, filename: 'anime.jpg', content_type: 'image/png')
article.save

file = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hbz-classic-movies-rebecca-gettyimages-2629943-1590707751.jpg')
article = List.new(name: 'Classic')
article.photo.attach(io: file, filename: 'classic.jpg', content_type: 'image/png')
article.save

file = URI.open('https://variety.com/wp-content/uploads/2022/01/scream.png')
article = List.new(name: 'Horror')
article.photo.attach(io: file, filename: 'horror.jpg', content_type: 'image/png')
article.save

file = URI.open('https://images4.alphacoders.com/909/thumb-1920-909185.jpg')
article = List.new(name: 'Superhero')
article.photo.attach(io: file, filename: 'superhero.jpg', content_type: 'image/png')
article.save

file = URI.open('https://www.denofgeek.com/wp-content/uploads/2016/01/kung-fu-panda-3.jpg?fit=910%2C564')
article = List.new(name: 'Kids')
article.photo.attach(io: file, filename: 'kids.jpg', content_type: 'image/png')
article.save
