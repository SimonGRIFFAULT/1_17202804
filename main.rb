require_relative 'fleet.rb'
require_relative 'trip_roster.rb'
require_relative 'trip_collection.rb'
require_relative 'trip.rb'
require_relative 'car.rb'


class Main
  fleet = Fleet.new
  IO.foreach('cars.txt') do |line|
    data = line.split
    id = data[0]
    litres_in_tank = data[1]
    km_per_litre = data[2]
    voiture = Car.new(id, litres_in_tank, km_per_litre)
    fleet.AddCar(voiture)
  end

  trips = TripCollection.new
  IO.foreach('trips.txt') do |line|
    data = line.split
    trip_id = data[0]
    trip_distance = data[1]
    trip = Trip.new(trip_id, trip_distance)
    trips.AddTrip(trip)
  end

  trip_roast = TripRoster.new
  trip_roast.FindTripForCar(fleet, trips)

end