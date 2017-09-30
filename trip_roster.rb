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
    fleet.cars.each do |id_car, car|
      car_dist = Integer(car.LitresInTank) * Integer(car.KmPerLitre)
      if ([max_distance, car_dist].max == car_dist)
        max_distance = car_dist
        @max_id_car = id_car
      end
    end
    puts "#{max_distance} ==>  #{@max_id_car}"
  end

   def FindMaxDistanceTrip(trip_collect)
    max_distance = 0
    trip_collect.trips.each { |id_trip, distance_s|
      distance = Integer(distance_s)
      if ([max_distance, distance].max == distance)
        max_distance = distance
        @max_id_trip = id_trip
      end
    }
  end

  def FindTripForCar(fleet, trip_collect)
    copy_fleet = fleet.clone
    copy_trip_collect = trip_collect.clone

    while (copy_fleet.cars != {}) #&& copy_trip_collect != {}#)
      FindMaxDistanceCar(copy_fleet)
      copy_fleet.cars.delete(@max_id_car) #at the end, copy_fleet no longer exist

      FindMaxDistanceTrip(copy_trip_collect)
      copy_trip_collect.trips.delete(@max_id_trip) #at the end, copy_trip no longer exist

      @collection_pairs.push(["trip#{@max_id_trip}","car#{@max_id_car}"])

    end
    @collection_pairs
  end
end

