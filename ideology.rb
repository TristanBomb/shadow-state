class Ideology
  attr_reader :name # String
  attr_reader :adjective # String
  attr_reader :category # Symbol
  attr_reader :ethos # [Float, Float, Float]
  attr_reader :preferred_govt # Symbol
  attr_reader :bonuses # Hash

  def initialize(opts = {})
    opts.each { |k,v| instance_variable_set("@#{k}".to_sym,v) }
    @name       ||= "Centrism"
    @adjective  ||= "Centrist"
    @category   ||= :moderate
    @ethos      ||= [1.0, 1.0, 1.0]
    @preferred_govt ||= :anocracy
    @bonuses    ||= {}
  end
end
