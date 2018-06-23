class Modifiable
  attr_reader :world
  attr_reader :stats
  attr_accessor :vars
  attr_accessor :modifiers

  @@defaults = nil

  def initialize(world)
    @world = world
    @stats = @@defaults.stats
    @vars = @@defaults.vars
    @modifiers = Set[]
  end

  def monthly_tick
    @modifiers.each { |mod| mod.monthly_tick }
    update_stats
  end

  def yearly_tick
    @modifiers.each { |mod| mod.yearly_tick }
  end

  def apply_modifier(mod_class, override: false, date: nil)
    collisions = @modifiers.select{|m| m.class == mod_class}
    if collisions.any? && override then
      collisions.each do |m|
        warn "modifier #{mod_class.to_s} already exists, removing old modifier"
        m.remove
      end
    elsif collisions.any? then
      warn "modifier #{mod_class.to_s} already exists, not adding another"
      false
    else
      mod = mod_class.new(self, date: date)
      @modifiers.add(mod)
      mod.apply
      update_stats
      true
    end
  end

  def reset_vars
    @vars = @@defaults.stats2vars(@stats)
  end

  def update_stats
    @stats = @@defaults.stats
    @modifiers.each do |mod|
      stats.merge!(mod.effects) { |key, v1, v2| v1 + v2 }
    end
  end

  def method_missing(sym, *args)
    if @vars.key?(sym)
      @vars[sym]
    elsif @vars.key?(sym.to_s.chomp('=').to_sym)
      @vars[sym] = *args
    elsif @stats.key?(sym)
      @stats[sym]
    elsif @stats.key?(sym.to_s.chomp('=').to_sym)
      @stats[sym] = *args
    else
      super
    end
  end
end
