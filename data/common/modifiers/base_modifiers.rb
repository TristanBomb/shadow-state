require_relative '../../../src/province'
require 'math'

class BasePoliticalGen < CountryModifier
  def tag
    :base_political_gen
  end

  def on_monthly_tick
    @country.stats[:pol_power]      += @country.attributes[:pol_power_gen]      * Math.exp(@country.attributes[:pol_power_factor])
    @country.stats[:diplo_cap]      += @country.attributes[:diplo_cap_gen]      * Math.exp(@country.attributes[:diplo_cap_factor])
    @country.stats[:mil_leadership] += @country.attributes[:mil_leadership_gen] * Math.exp(@country.attributes[:mil_leadership_factor])
    super
  end
end

class BaseStability < CountryModifier
  def tag
    :base_stability
  end

  def on_monthly_tick
    stab = @country.stats[:stability]
    base_stab = @country.attributes[:stability_base]
    stab_decay = @country.attributes[:stability_decay]
    stab -= (stab - base_stab) * stab_decay
    super
  end
end
