require_relative 'fleet.rb'
require_relative 'trip_collection.rb'

require_relative 'trip.rb'
require_relative 'car.rb'

class TripRoster

  def initialize()
    @collection_pairs = []
  end

  def FindMaxDistanceCar(fleet)
    max_distance = 0

    print fleet.cars

    fleet.each do |id_car_s|
      id_car = Integer(id_car_s)
      car_dist = (id_car.GetLitresInTank()) * (id_car.GetKmPerLitre())
      if ([max_distance, car_dist].max == car_dist)
        max_distance = car_dist
        @max_id_car = id_car
      end
    end
  end

  def FindMaxDistanceTrip(trip_collect)
    max_distance = 0
    trip_collect.each { |id_trip, distance|
      if ([max_distance, distance].max == distance)
        max_distance = distance
        @max_id_trip = id_trip
      end
    }
  end

  def FindTripForCar(fleet, trip_collect)
    copy_fleet = fleet.clone
    copy_trip_collect = trip_collect.clone

    while (copy_fleet != {} && copy_trip_collect != {})
      FindMaxDistanceCar(copy_fleet)
      copy_fleet.delete(@max_id_car) #at the end, copy_fleet no longer exist

      FindMaxDistanceTrip(copy_trip_collect)
      copy_fleet.delete(@max_id_trip) #at the end, copy_trip no longer exist

      @collection_pairs.push("trip#{@max_id_trip}","car#{@max_id_car}")

    end
    puts @collection_pairs
  end
end

