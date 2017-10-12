class Country
  attr_accessor :name # String
  attr_accessor :long_name # String
  attr_accessor :gov_type # Symbol
  attr_accessor :ideology # Symbol
  attr_accessor :ethos # [Float, Float, Float]
  attr_accessor :influence # Float
  attr_accessor :prestige # Float
  attr_accessor :techs # Hash

  attr_accessor :on_ideology_change

  def initialize(opts = {})
    opts.each { |k,v| instance_variable_set("@#{k}".to_sym,v) }
    @name       ||= "Default Name"
    @long_name  ||= "Default Long Name"
    @gov_type   ||= :autocracy
    @ideology   ||= :centrism
    @ethos      ||= [0.0, 0.0, 0.0]
    @influence  ||= 0.0
    @prestige   ||= 0.0
    @techs      ||= {}

    @on_ideology_change ||= lambda do end

  end
end
