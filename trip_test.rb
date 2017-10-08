require 'test/unit'
require_relative 'trip.rb'

class TripTest < Test::Unit::TestCase
  def setup
    @new_trip = Trip.new(12,230)
  end

  def test_Id
    assert_equal(@new_trip.Id, 12, "not the same Id")
  end

  def test_Distance
    assert_equal(@new_trip.Distance, 230, "not the same distance")
  end
end