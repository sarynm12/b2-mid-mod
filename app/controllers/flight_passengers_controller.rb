class FlightPassengersController < ApplicationController

  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    fp = FlightPassenger.create(flight_id: flight.id, passenger_id: passenger.id)
    fp.destroy
    redirect_to '/flights'
  end

end
