require_relative 'trip.rb'

class TripCollection

  def initialize()
    @trips = {}
  end

  def trips
    @trips
  end

  def AddTrip(trip)
    trip_id = trip.Id
    @trips[trip_id] = trip.Distance
  end




end