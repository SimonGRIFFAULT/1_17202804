require 'test/unit'

require_relative 'fleet.rb'
require_relative 'trip_roster.rb'
require_relative 'trip_collection.rb'
require_relative 'trip.rb'
require_relative 'car.rb'

class TripRosterTests < Test::Unit::TestCase
  def setup
    @test_roster = TripRoster.new
    @new_fleet = Fleet.new()
    @new_trips = TripCollection.new()
    trip1 = Trip.new(7,130)
    trip2 = Trip.new(10,100)
    voiture1 = Car.new(12, 340, 56)
    voiture2 = Car.new(1, 200, 13)
    @new_trips.AddTrip(trip1)
    @new_trips.AddTrip(trip2)
    @new_fleet.AddCar(voiture1)
    @new_fleet.AddCar(voiture2)
  end

  def test_Initialize
    assert_equal(@test_roster.collection_pairs, [], "test_roster.collection_pairs should be empty")
  end

  def test_FindMaxDistanceCar
    assert_equal(@test_roster.FindMaxDistanceCar(@new_fleet), 12, "The car which can travel the longer should be car n°12")
  end
  def test_FindMaxDistanceTrip
    assert_equal(@test_roster.FindMaxDistanceTrip(@new_trips), 7, "The longer trip should be trip n°7")
  end

  def test_FindTripForCar
    assert_equal(@test_roster.FindTripForCar(@new_fleet, @new_trips), [["trip7","car12"],["trip10","car1"]], "The pairs of Trip/Car doesn't match")
  end
end