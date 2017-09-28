class Trip

  def initialize(id, distance)
    @id = id
    @distance = distance
  end

  def GetTripId()
    self.id
  end

  def GetDistance()
    self.distance
  end

end