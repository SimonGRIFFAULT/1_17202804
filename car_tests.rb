require 'test/unit'
require_relative 'car.rb'

class CarTests < Test::Unit::TestCase
  def setup
     @new_car = Car.new(1, 200, 10)
  end

  def test_Id
    assert_equal(@new_car.Id, 1, "not the same Id")
  end

  def test_LitresInTank
    assert_equal(@new_car.LitresInTank, 200, "not the same litres in tank")
  end

  def test_KmPerLitre
    assert_equal(@new_car.KmPerLitre, 10, "not the same Km per litre")
  end

end