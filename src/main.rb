require_relative 'country_modifier'
$w = World.new
$w.add_country(:germany, color: "#224444")
# # #
germany = $w.country_by_tag(:germany)
# # #
class ModifierStabilityIncreased < CountryModifier
  def tag
    :stability_increased
  end
  def effects
    { stability: 0.1 }
  end
end
germany.apply_modifier(ModifierStabilityIncreased)
# # #
germany.apply_modifier(Class.new(CountryModifier) do
  def tag
    :happiness_decreased
  end
  def effects
    {happiness: -0.2 }
  end
end)
# # #
puts germany.attributes
