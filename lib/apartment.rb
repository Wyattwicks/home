class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter

  def initialize(unit)
    @number = unit[:number]
    @monthly_rent = unit[:monthly_rent]
    @bathrooms = unit[:bathrooms]
    @bedrooms = unit[:bedrooms]

  end

  def add_renter(renter)
    @renter = renter
  end
end
