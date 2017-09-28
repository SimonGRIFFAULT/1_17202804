require_relative 'trip.rb'

class TripCollection

  def initialize()
    @trips = {}
  end

  def AddTrip(trip)
    trip_id = trip.GetTripId
    @trips[trip_id] = trip.GetDistance
  end




end