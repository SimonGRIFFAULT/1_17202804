require 'test/unit'
require_relative 'fleet.rb'
require_relative 'car.rb'

class FleetTest < Test::Unit::TestCase
  def setup
    @test_fleet = Fleet.new
  end

  def test_Initialize
    assert_equal(@test_fleet.cars, {},"test_fleet supposed to be an empty hashmap" )
  end

  def test_AddCar
    voiture = Car.new(12, 340, 56)
    @test_fleet.AddCar(voiture)
    id = @test_fleet.cars[12].Id
    litres = @test_fleet.cars[12].LitresInTank
    km = @test_fleet.cars[12].KmPerLitre
    assert_equal(id, 12,"the Id car added doesn't correspond with the one ine the hashmap")
    assert_equal(litres, 340,"the litres In Tank of the car added doesn't correspond with the one ine the hashmap")
    assert_equal(km,56, "the KmPerLitre of the added car doesn't correspond with the one ine the hashmap")
  end
end