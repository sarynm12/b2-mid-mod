require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'instance methods' do
    it 'can return unique list of passengers' do
      southwest = Airline.create!(name: 'Southwest')
      frontier = Airline.create!(name: 'Frontier')
      flight1 = southwest.flights.create!(number: '1224')
      flight2 = southwest.flights.create!(number: '1220')
      flight3 = frontier.flights.create!(number: '2244')
      passenger1 = flight1.passengers.create!(name: 'Saryn', age: 28)
      passenger2 = flight1.passengers.create!(name: 'Tyler', age: 30)
      passenger3 = flight2.passengers.create!(name: 'Alex', age: 28)
      passenger4 = flight2.passengers.create!(name: 'Dan', age: 16)
      flight2.passengers << passenger1

      expect(southwest.passengers).to eq([passenger1, passenger1, passenger2, passenger3, passenger4])
      expect(southwest.unique_passengers).to eq(['Alex', 'Dan', 'Saryn', 'Tyler'])
    end

  end
end
