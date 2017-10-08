class TripRoster

  def initialize()
    @collection_pairs = []
  end

  def collection_pairs
    @collection_pairs
  end

  def FindMaxDistanceCar(fleet) #find the car wich can travel the longer distance and return it's id
    max_distance = -1
    max_id_car = -1
    fleet.cars.each do |id_car, car|
      car_dist = Integer(car.LitresInTank) * Integer(car.KmPerLitre)
      if ([max_distance, car_dist].max == car_dist)
        max_distance = car_dist
        max_id_car = id_car
      end
    end
    max_id_car
  end

   def FindMaxDistanceTrip(trip_collect) #find trip with the longer distance and return it's id
    max_distance = -1
    max_id_trip = -1
    trip_collect.trips.each { |id_trip, distance_s|
      distance = Integer(distance_s)
      if ([max_distance, distance].max == distance)
        max_distance = distance
        max_id_trip = id_trip
      end
    }
     max_id_trip
  end

  def FindTripForCar(fleet, trip_collect)
    copy_fleet = fleet.clone
    copy_trip_collect = trip_collect.clone
    if (copy_trip_collect.trips.length != copy_fleet.cars.length) #check the number of cars and trips, should be the same
      puts "not as much cars as trips"
    else
        while (copy_fleet.cars != {} && copy_trip_collect != {})
        max_id_car = FindMaxDistanceCar(copy_fleet)
        copy_fleet.cars.delete(max_id_car) #once we found the maximum, we delete it to find the second max, etc.
                                           # At the end, copy_fleet.cars no longer exist

        max_id_trip = FindMaxDistanceTrip(copy_trip_collect)
        copy_trip_collect.trips.delete(max_id_trip) #at the end, copy_trip no longer exist

        @collection_pairs.push(["trip#{max_id_trip}","car#{max_id_car}"]) #puts the pair car/trip in the array

      end
      @collection_pairs
      end
    end
end

