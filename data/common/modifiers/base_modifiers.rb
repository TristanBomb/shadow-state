require_relative '../../../src/country_modifier'
include Math

class BasePoliticalGen < CountryModifier
  def tag
    :base_political_gen
  end

  def monthly_tick
    @country.vars[:pol_power]      += @country.stats[:pol_power_gen]      * exp(@country.stats[:pol_power_factor])
    @country.vars[:diplo_cap]      += @country.stats[:diplo_cap_gen]      * exp(@country.stats[:diplo_cap_factor])
    @country.vars[:mil_leadership] += @country.stats[:mil_leadership_gen] * exp(@country.stats[:mil_leadership_factor])
    super
  end
end

class BaseStability < CountryModifier
  def tag
    :base_stability
  end

  def monthly_tick
    @country.vars[:stability] = @country.vars[:stability] - (@country.vars[:stability] - @country.stats[:stability_base]) * @country.stats[:stability_decay]
    super
  end
end

class BaseReputation < CountryModifier
  def tag
    :base_reputation
  end

  def monthly_tick
    rep = @country.vars[:reputation]
    base_rep  = @country.stats[:reputation_base]
    rep_decay = @country.stats[:reputation_decay]
    rep -= (rep - base_rep) * rep_decay
    super
  end
end

class BaseTechnology < CountryModifier
  def tag
    :base_technology
  end

  def monthly_tick
    @country.vars[:technology] += @country.stats[:technology_gen] * exp(@country.stats[:technology_factor])
    super
  end
end

class BaseCulture < CountryModifier
  def tag
    :base_culture
  end

  def monthly_tick
    @country.vars[:culture] += @country.stats[:culture_gen] * exp(@country.stats[:culture_factor])
    super
  end
end

class BasePrestige < CountryModifier
  def tag
    :base_prestige
  end

  def monthly_tick
    @country.vars[:prestige] *= (1.0 - @country.stats[:prestige_decay])
    @country.vars[:prestige] += @country.stats[:prestige_gen] * exp(@country.stats[:prestige_factor])
    super
  end
end
