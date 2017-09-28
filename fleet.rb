
class Fleet

  def initialize()
    @cars = {}
  end

  def AddCar(car)
    id = car.GetCarId
    @cars[id] = car
  end



end
