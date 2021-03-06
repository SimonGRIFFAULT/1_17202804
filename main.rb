require_relative 'fleet.rb'
require_relative 'trip_roster.rb'
require_relative 'trip_collection.rb'
require_relative 'trip.rb'
require_relative 'car.rb'

def GetFleetFromFile
  fleet = Fleet.new
  IO.foreach('cars.txt') do |line| #create and fill a hashtable with the cars from the input file 'cars.txt'
    data = line.split
    id = data[0]
    litres_in_tank = data[1]
    km_per_litre = data[2]
    voiture = Car.new(id, litres_in_tank, km_per_litre)
    fleet.AddCar(voiture)
  end
  puts fleet.cars
  fleet
end


def GetTripCollectionFromFile
  trips = TripCollection.new
  IO.foreach('trips.txt') do |line|  #create and fill a hashtable with the trips from the input file 'cars.txt'
    data = line.split
    trip_id = data[0]
    trip_distance = data[1]
    trip = Trip.new(trip_id, trip_distance)
    trips.AddTrip(trip)
  end
  trips
end

fleet = GetFleetFromFile()
trip_collection = GetTripCollectionFromFile()
trip_roast = TripRoster.new
collection_pair = trip_roast.FindTripForCar(fleet, trip_collection)
collection_pair.each do |x|
  puts "#{x[0]} is undertaken by #{x[1]}"
end

