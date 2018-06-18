require_relative 'world'
class Country
  attr_reader :tag
  attr_reader :world
  attr_reader :attributes
  attr_accessor :gov_type
  attr_accessor :flag
  attr_accessor :color
  attr_accessor :modifiers

  # TODO: Define attributes
  BASE_ATTRIBUTES = {
    happiness: 0.5,
    stability: 0.5
  }

  def initialize(tag, world:, flag: nil, color: "#000000")
    if world.countries.select{|c| c.tag == tag}.any?
      raise "country tag #{tag} exists already!"
    end
    @world = world
    @tag = tag
    @flag = flag
    @color = color
    @modifiers = Set[]
    @attributes = BASE_ATTRIBUTES
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
