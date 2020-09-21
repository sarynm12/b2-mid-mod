require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'instance methods' do
    it 'can return count of flights for a passenger' do
      southwest = Airline.create!(name: 'Southwest')
      flight1 = southwest.flights.create!(number: '1224')
      flight2 = southwest.flights.create!(number: '1220')
      passenger1 = flight1.passengers.create!(name: 'Saryn', age: 28)
      passenger2 = flight1.passengers.create!(name: 'Tyler', age: 30)
      passenger3 = flight2.passengers.create!(name: 'Alex', age: 28)
      passenger4 = flight2.passengers.create!(name: 'Dan', age: 16)
      flight2.passengers << passenger1

    expect(passenger1.flight_count).to eq(2)
    end 
  end
end
