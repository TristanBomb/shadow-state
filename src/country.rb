require_relative 'world'
require_relative 'country_defaults'

class Country
  attr_reader :tag # localization and country name
  attr_reader :world # the world this country is in
  attr_reader :stats # contains values that can only be modified by modifiers (don't try to directly modify these, it won't work)
  attr_accessor :vars # contains mutable values
  attr_accessor :gov_type # :democracy, :monarchy, :socialist, :capitalist, :nationalist
  attr_accessor :flag # path to national flag
  attr_accessor :color # map color
  attr_accessor :modifiers # a Set of CountryModifiers

  def initialize(tag, world:, flag: nil, color: "#000000", gov_type: :monarchy)
    if world.countries.select{|c| c.tag == tag}.any?
      raise "country tag #{tag} exists already!"
    end
    @world = world
    @tag = tag
    @flag = flag
    @color = color
    @modifiers = Set[]
    @stats = CountryDefaults.stats
    @vars = CountryDefaults.vars
  end

  def monthly_tick
    @modifiers.each { |mod| mod.monthly_tick }
    update_stats
  end

  def yearly_tick
    @modifiers.each { |mod| mod.yearly_tick }
  end

  def to_s
    @tag.to_s
  end

  def to_sym
    @tag.to_sym
  end

  def apply_modifier(mod_class, override: false, date: nil)
    collisions = @modifiers.select{|m| m.class == mod_class}
    if collisions.any? && override then
      collisions.each do |m|
        warn "modifier #{mod_class.to_s} already exists on country #{@tag}, removing old modifier"
        m.remove
      end
    elsif collisions.any? then
      warn "modifier #{mod_class.to_s} already exists on country #{@tag}, not adding another"
      false
    else
      mod = mod_class.new(self, date: date)
      @modifiers.add(mod)
      mod.apply
      update_stats
      true
    end
  end

  def update_stats
    @stats = CountryDefaults.stats
    @modifiers.each do |mod|
      stats.merge!(mod.effects) { |key, v1, v2| v1 + v2 }
    end
  end

  def reset_vars
    @vars = CountryDefaults.stats_to_vars(@stats)
  end
end
