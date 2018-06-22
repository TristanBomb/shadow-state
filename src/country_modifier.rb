require_relative 'country'
class CountryModifier
  attr_reader :country # The country this modifier applies to
  attr_reader :world # The world this modifier is in
  attr_accessor :expiration_date # When this modifier expires

  def initialize(country)
    @country = country
    @world = country.world
  end

  def tag
  end

  def visible?
      false
  end

  def on_applied
  end

  def on_removed
    @country.modifiers.delete(self)
    @country.update_attributes
  end

  def on_expiry
    on_removed
  end

  def on_monthly_tick
    if @expiration_date && world.date >= @expiration_date then on_expiry end
  end

  def on_yearly_tick
  end

  def effects
    {}
  end
end
