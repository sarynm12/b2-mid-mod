require 'rails_helper'

RSpec.describe 'flights index page' do
  before(:each) do
    @southwest = Airline.create!(name: 'Southwest')
    @flight1 = @southwest.flights.create!(number: '1224')
    @flight2 = @southwest.flights.create!(number: '1220')
    @passenger1 = @flight1.passengers.create!(name: 'Saryn', age: 28)
    @passenger2 = @flight1.passengers.create!(name: 'Tyler', age: 30)
    @passenger3 = @flight2.passengers.create!(name: 'Alex', age: 28)
    @passenger4 = @flight2.passengers.create!(name: 'Dan', age: 16)
  end

  it 'should display a list of flight numbers, and under each, the passenger names on that flight' do

    visit '/flights'

    within "#flight-#{@flight1.id}" do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
    end

    within "#flight-#{@flight2.id}" do
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end

  end
end
