require './lib/building'
require './lib/apartment'
require './lib/renter'

class Building

  attr_reader :units, :renters

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

end
