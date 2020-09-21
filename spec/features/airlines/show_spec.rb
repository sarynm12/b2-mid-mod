require 'rails_helper'

RSpec.describe 'airline show page' do
  before(:each) do
    @southwest = Airline.create!(name: 'Southwest')
    @frontier = Airline.create!(name: 'Frontier')
    @flight1 = @southwest.flights.create!(number: '1224')
    @flight2 = @southwest.flights.create!(number: '1220')
    @flight3 = @frontier.flights.create!(number: '2244')
    @passenger1 = @flight1.passengers.create!(name: 'Saryn', age: 28)
    @passenger2 = @flight1.passengers.create!(name: 'Tyler', age: 30)
    @passenger3 = @flight2.passengers.create!(name: 'Alex', age: 28)
    @passenger4 = @flight2.passengers.create!(name: 'Dan', age: 16)
    @flight2.passengers << @passenger1
  end

  it 'should display a unique list of passengers that have flights from that airline' do

    visit "/airlines/#{@southwest.id}"

    expect(@southwest.unique_passengers.count).to eq(4)

    expect(page).to have_content(@southwest.name)
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger2.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger4.name)

    visit "/airlines/#{@frontier.id}"
    expect(page).to have_content(@frontier.name)
  end
end


# User Story 2, Airlines Show Page
# As a visitor
# When I visit an airlines show page ('/airlines/:id')
# I see a unique list of passengers that have flights from that airline
# ```
# ```
