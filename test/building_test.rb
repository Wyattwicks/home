require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require './lib/renter'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
  end
  def test_new_building
    building = Building.new

    assert_instance_of Building, building
  end

  def test_new_building_can_have_units
    building = Building.new

    assert_equal [], building.units
  end

  def test_add_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [unit1, unit2], building.units
  end

  def test_add_renter
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    renter1 = Renter.new("Aurora")
    renter2 = Renter.new("Tim")
    unit1.add_renter(renter1)
    unit2.add_renter(renter2)
    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [renter1.name, renter2.name], building.renters
  end

  def test_average_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal 1099.5, building.average_rent
  end

  def test_rented_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    renter1 = Renter.new("Spencer")
    @unit2.add_renter(renter1)

    assert_equal [@unit2], @building.rented_units
  end

  def test_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    renter1 = Renter.new("Spencer")
    @unit2.add_renter(renter1)
    renter2 = Renter.new("Jessie")
    @unit1.add_renter(renter2)
    renter3 = Renter.new("Max")
    @unit3.add_renter(renter3)


    @building.rented_units
    assert_equal renter2, @building.renter_with_highest_rent
  end

  def test_units_by_number_of_bedrooms
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)

    bedroom_list = {
                    3 => ["D4" ],
                    2 => ["B2", "C3"],
                    1 => ["A1"]
                    }

    assert_equal bedroom_list, @building.units_by_number_of_bedrooms
  end

end
