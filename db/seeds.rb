# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@southwest = Airline.create!(name: 'Southwest')
@flight1 = @southwest.flights.create!(number: '1224')
@flight2 = @southwest.flights.create!(number: '1220')
@passenger1 = @flight1.passengers.create!(name: 'Saryn', age: 28)
@passenger2 = @flight1.passengers.create!(name: 'Tyler', age: 30)
@passenger3 = @flight2.passengers.create!(name: 'Alex', age: 28)
@passenger4 = @flight2.passengers.create!(name: 'Dan', age: 16)
