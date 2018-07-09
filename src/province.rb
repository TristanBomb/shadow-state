require_relative 'modifiable'

# A province in the game world
class Province < Modifiable
  # @return [Symbol] a unique identifier for this province (eg. +:california+)
  attr_reader :tag
  # @return [Country] the country that owns this province
  attr_accessor :owner
  # @return [Country] the country that occupies this province; same as +owner+ in peacetime
  attr_accessor :occupant
  # @return [Numeric] the population value of this province; this property is _not_ linear
  attr_accessor :population
  # @return [Numeric] the development value of this province; this property is _not_ linear
  attr_accessor :development
  # @return [Numeric] this province's progress towards gaining another population value
  attr_accessor :population_progress
  # @return [Numeric] this province's progress towards gaining another development value
  attr_accessor :development_progress
  # @return [Hash{Country=>Symbol}] a hash containing different countries' claims on this province
  #   The symbols can have the following values: +:conquest+, +:reconquest+, +:unification+
  attr_accessor :claims

  # Temporary place to put equations:
  # Economic output = @population * @development * exp(sum_of_modifiers)
  # Increase in dev progress = economic output * (1-tax_rate)
  # Development progress required = @population * @development * 240
end
