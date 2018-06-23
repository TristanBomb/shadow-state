class Province < Modifiable
  attr_reader :tag
  attr_accessor :owner
  attr_accessor :occupant
  attr_accessor :population
  attr_accessor :development
  attr_accessor :population_progress
  attr_accessor :development_progress
  attr_accessor :claims

  # Temporary place to put equations:
  # Economic output = @population * @development * exp(sum_of_modifiers)
end
