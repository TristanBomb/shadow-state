require_relative 'country'
class CountryModifier
  attr_reader :country # The country this modifier applies to
  attr_reader :world # The world this modifier is in
  attr_accessor :expiration_date # When this modifier expires

  def initialize(country, date: nil)
    @country = country
    @world = country.world
    @expiration_date = date
  end

  def tag
  end

  def visible?
      false
  end

  def apply
  end

  def remove
    @country.modifiers.delete(self)
    @country.update_stats
  end

  def expire
    remove
  end

  def monthly_tick
    if @expiration_date && (world.date >= @expiration_date) then expire end
  end

  def yearly_tick
  end

  def effects
    {}
  end
end
