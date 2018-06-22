require_relative 'world'
class Country
  attr_reader :tag # localization and country name
  attr_reader :world # the world this country is in
  attr_reader :attributes # contains static attributes (modifiable with modifiers only)
  attr_accessor :stats # contains mutable resources and statistics
  attr_accessor :gov_type # :democracy, :monarchy, :socialist, :capitalist, :nationalist
  attr_accessor :flag # path to national flag
  attr_accessor :color # map color
  attr_accessor :modifiers # a Set of CountryModifiers

  # TODO: Define attributes
  BASE_ATTRIBUTES = {
    pol_power_gen: 10,
    pol_power_factor: 0,
    diplo_cap_gen: 10,
    diplo_cap_factor: 0,
    mil_leadership_gen: 10,
    mil_leadership_factor: 0,
    income: 0,
    income_factor: 0,
    expenses: 0,
    stability_base: 0.5,
    stability_decay: 0.01,
    reputation_base: 0,
    reputation_decay: 0.01,
    prestige_gen: 0,
    prestige_factor: 0,
    prestige_decay: 0.025,
    culture_gen: 0,
    culture_mult: 0,
    technology_gen: 0,
    technology_factor: 0,
    happiness: 0.5,
    unrest_gen: 0,
    unrest_factor: 0,
    unrest_decay: 0.01,
    troop_attack: 1,
    troop_defense: 1,
    troop_maneuver: 1,
    troop_morale: 1,
    tax_factor: 0.5,
    recruitment_factor: 0.01
  }
  BASE_ATTRIBUTES.default = 0

  BASE_STATS = {
    pol_power: 0,
    diplo_cap: 0,
    mil_leadership: 0,
    treasury: 0,
    stability: 0,
    technology: 0,
    culture: 0,
    unrest: 0,
    manpower: 0
  }
  BASE_STATS.default = 0

  def initialize(tag, world:, flag: nil, color: "#000000", gov_type: :monarchy)
    if world.countries.select{|c| c.tag == tag}.any?
      raise "country tag #{tag} exists already!"
    end
    @world = world
    @tag = tag
    @flag = flag
    @color = color
    @modifiers = Set[]
    @attributes = BASE_ATTRIBUTES.dup
    @stats = BASE_STATS.dup
  end

  def on_monthly_tick
    @modifiers.each { |mod| mod.on_monthly_tick }
    update_attributes
  end

  def on_yearly_tick
    @modifiers.each { |mod| mod.on_yearly_tick }
  end

  def apply_modifier(mod_class)
    mod = mod_class.new(self)
    if @modifiers.select{|m| m.tag == mod_class}.any?
      puts "country tag #{tag} exists already!"
    end
    @modifiers.add(mod)
    mod.on_applied
    update_attributes
    true
  end

  def update_attributes
    @attributes = BASE_ATTRIBUTES.dup
    @modifiers.each do |mod|
      h = mod.effects
      BASE_ATTRIBUTES.each do |attr_k, attr_v|
        @attributes[attr_k] += h[attr_k] || 0
      end
    end
  end
end
