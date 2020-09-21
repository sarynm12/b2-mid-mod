class Passenger < ApplicationRecord

  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
  validates_presence_of :name, :age

  def flight_count
    flights.count
  end

end
