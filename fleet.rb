class Fleet
  def initialize(numb)
    @number = numb
  end
end

class Car
  def initialize(id, litres, km)
    @id = id
    @litres_in_tank = litres
    @km_per_litre = km
  end
end

class Trip(id, distance)
  def initialize
    @id = id
    @distance = distance
  end

end

class TripCollection(nb)
  def initialize
    @numbers_of_trips = nb
  end
end

class TripRoster
  def initialize()
    @collection_pairs = []
  end
end
