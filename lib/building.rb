require './lib/building'
require './lib/apartment'
require './lib/renter'

class Building

  attr_reader :units, :renters, :bedrooms, :number

  def initialize
    @units = []


  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @renters = []
    @units.find_all do |unit|
      @renters << unit.renter.name
    end
    @renters
  end

  def average_rent
    @average_rent = []
    @units.find_all do |unit|
       @average_rent << unit.monthly_rent
    end
    @average_rent.inject{|sum, el| sum + el }.to_f / @average_rent.size
  end

  def rented_units
    @rented_units = []
    @units.find_all do |unit|
      if unit.renter == nil
        nil
      else
        @rented_units << unit
      end
    end
  end

  def renter_with_highest_rent

    highest_rent = []
    @rented_units.max_by do |unit|
      highest_rent << unit.renter
    end
    highest_rent[0]
  end

  def units_by_number_of_bedrooms
    bedroom_hash = Hash.new
    @units.max_by do |unit|
        
      bedroom_hash.each do |bedrooms:, number:|
      end
    end
    bedroom_hash.max_by do |bedrooms:|
    end
    bedroom_hash
  end




end
