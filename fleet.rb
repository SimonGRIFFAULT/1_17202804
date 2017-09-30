require_relative 'car.rb'

class Fleet

  def initialize()
    @cars = {}
  end

  def cars
    @cars
  end

  def AddCar(car)
    id = car.Id
    @cars[id] = car
  end

end
