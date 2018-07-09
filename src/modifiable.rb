require 'set'
require_relative 'modifier'
require_relative 'world'

# A game object that can have modifiers, statistics, and dynamic variables.
# @note Modifiable is intended for inheritance, rather than direct use.
class Modifiable
  # @return [World] the world this object belongs to
  attr_reader :world
  # @return [Hash{Symbol=>Numeric}] a table of static values for this object
  # @note Stats are not designed to be modified directly; use modifiers instead
  attr_reader :stats
  # @return [Hash{Symbol=>Numeric}] a table of dynamic values for this object
  # @note Vars can't be changed with modifiers; do this directly instead
  attr_accessor :vars
  # @return [Set<Modifier>] the set of modifiers that apply to this object
  attr_accessor :modifiers

  # The default vars for this object.
  @@defaults = nil

  # Creates a new modifiable object.
  #
  # @param world [World] the world to create this object in
  # @return [self] the newly-created object
  def initialize(world)
    @world = world
    @stats = @@defaults.stats
    @vars = @@defaults.vars
    @modifiers = Set[]
    self
  end

  # Takes actions that occur on the monthly tick, including modifier ticks and updating stats.
  #
  # @return [self]
  def monthly_tick
    @modifiers.each { |mod| mod.monthly_tick }
    update_stats
    self
  end

  # Takes actions that occur on the yearly tick, including modifier ticks and updating stats.
  #
  # @return [self]
  def yearly_tick
    @modifiers.each { |mod| mod.yearly_tick }
    update_stats
    self
  end

  # Adds a new modifier to this object.
  #
  # @param mod_class [Class] the class to base the new modifier off
  # @param override [Type] whether to remove any other modifiers with the same tag
  # @param date [Date] the current date
  # @return [self]
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
    self
  end

  # Resets the +vars+ of this object based on its +stats+.
  #
  # @return [Hash{Symbol=>Numeric}] the new +vars+
  def reset_vars
    @vars = @@defaults.stats2vars(@stats)
  end

  # Updates the +stats+ of this object based on its modifiers.
  #
  # @return [Hash{Symbol=>Numeric}] the new +stats+
  def update_stats
    @stats = @@defaults.stats
    @modifiers.each do |mod|
      stats.merge!(mod.effects) { |key, v1, v2| v1 + v2 }
    end
    @stats
  end

  # If a method does not exist on the object, and the method name is a key in vars or stats,
  # you can use method syntax to access those. Vars gets first priority, then vars=, then stats.
  #
  # @param sym [Symbol] the key to access
  # @param args [Type] what to set the key equal to (vars= only)
  # @return [Numeric] the value corresponding to the key
  # @note Accessing a missing method will still raise the appropriate exception if the key cannot be found!
  def method_missing(sym, *args)
    if @vars.key?(sym)
      @vars[sym]
    elsif @vars.key?(sym.to_s.chomp('=').to_sym)
      @vars[sym] = *args
    elsif @stats.key?(sym)
      @stats[sym]
    else
      super
    end
  end
end
