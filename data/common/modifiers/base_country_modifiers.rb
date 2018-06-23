require_relative '../../../src/modifier'
include Math

class BasePoliticalGen < CountryModifier
  def tag
    :base_political_gen
  end

  def monthly_tick
    @country.pol_power      += @country.pol_power_gen      * exp(@country.pol_power_factor)
    @country.diplo_cap      += @country.diplo_cap_gen      * exp(@country.diplo_cap_factor)
    @country.mil_leadership += @country.mil_leadership_gen * exp(@country.mil_leadership_factor)
    super
  end
end

class BaseStability < CountryModifier
  def tag
    :base_stability
  end

  def monthly_tick
    @country.stability = @country.stability - (@country.stability - @country.stability_base) * @country.stability_decay
    super
  end
end

class BaseReputation < CountryModifier
  def tag
    :base_reputation
  end

  def monthly_tick
    rep = @country.reputation
    base_rep  = @country.reputation_base
    rep_decay = @country.reputation_decay
    rep -= (rep - base_rep) * rep_decay
    super
  end
end

class BaseTechnology < CountryModifier
  def tag
    :base_technology
  end

  def monthly_tick
    @country.technology += @country.technology_gen * exp(@country.technology_factor)
    super
  end
end

class BaseCulture < CountryModifier
  def tag
    :base_culture
  end

  def monthly_tick
    @country.culture += @country.culture_gen * exp(@country.culture_factor)
    super
  end
end

class BasePrestige < CountryModifier
  def tag
    :base_prestige
  end

  def monthly_tick
    @country.prestige *= (1.0 - @country.prestige_decay)
    @country.prestige += @country.prestige_gen * exp(@country.prestige_factor)
    super
  end
end
