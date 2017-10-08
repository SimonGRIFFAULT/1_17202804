class TripCollection

  def initialize()
    @trips = {}
  end

  def trips
    @trips
  end

  def AddTrip(trip)
    @trips[trip.Id] = trip.Distance
  end




end