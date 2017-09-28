class Car

  def initialize(id, litres, km)
    @id = id
    @litres_in_tank = litres
    @km_per_litre = km
  end

  def GetCarId()
    self.id
  end

  def GetLitresInTank()
    self.litres_in_tank
  end

  def GetKmPerLitre()
    self.km_per_litre
  end

end