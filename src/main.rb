require_relative '../data/common/modifiers/base_country_modifiers'
require_relative 'world'
require_relative 'country'

$w = World.new
$w.add_country(:germany, color: "#224444")

# # #

germany = $w.tag2country(:germany)

# # #

class StabilityIncreased < CountryModifier
  def tag
    :stability_increased
  end
  def effects
    { stability_base: 0.1 }
  end
end
germany.apply_modifier(StabilityIncreased)

# # #

germany.apply_modifier(BaseStability)

# # #

$w.monthly_tick
arr = []
germany.modifiers.each {|m| arr << m.tag}
puts arr
puts germany.stats
puts germany.vars

puts "Resetting..."
germany.reset_vars
puts germany.vars
