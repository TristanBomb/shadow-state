class Modifier
  attr_reader :target # The object this modifier applies to
  attr_reader :world # The world this modifier is in
  attr_accessor :expiration_date # When this modifier expires

  def initialize(target, date: nil)
    @target = target
    @world = target.world
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
    @target.modifiers.delete(self)
    @target.update_stats
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

class CountryModifier < Modifier
  attr_reader :country

  def initialize(target, date: nil)
    @country = target
  end
end

class ProvinceModifier < Modifier
  attr_reader :province

  def initialize(target, date: nil)
    @province = target
  end
end
