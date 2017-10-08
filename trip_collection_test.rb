require 'test/unit'
require_relative 'trip_collection'
require_relative 'trip.rb'

class TripCollectionTest < Test::Unit::TestCase
  def setup
    @test_collection = TripCollection.new()
  end

  def test_Initialize
    assert_equal(@test_collection.trips, {},"test_collection supposed to be an empty hashmap" )
  end

  def test_AddTrip
    trip = Trip.new(7,130)
    @test_collection.AddTrip(trip)
    assert_equal(@test_collection.trips[7], 130,"the distance of the added trip doesn't correspond with the one ine the hashmap")
  end

end