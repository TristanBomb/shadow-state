include Math

module CountryDefaults
  module_function

  def stats
    # Note: Less efficient than using constants, but also less likely to lead to hard-to-track bugs if the constant is accidentally mutated
    stats = {
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
      technology_gen: 0,
      technology_factor: 0,
      culture_gen: 0,
      culture_mult: 0,
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
    stats.default = 0
    return stats
  end

  def vars
    # Note: Less efficient than using constants, but also less likely to lead to hard-to-track bugs if the constant is accidentally mutated
    vars = {
      pol_power: 0,
      diplo_cap: 0,
      mil_leadership: 0,
      treasury: 0,
      stability: 0.5,
      reputation: 0,
      prestige: 0,
      technology: 0,
      culture: 0,
      unrest: 0,
      manpower: 0
    }
    vars.default = 0
    return vars
  end

  def stats2vars(cstats) # NOTE: Should this be an event instead?
    {
      pol_power: cstats[:pol_power_gen] * exp(cstats[:pol_power_factor]) * 12,
      diplo_cap: cstats[:diplo_cap_gen] * exp(cstats[:diplo_cap_factor]) * 12,
      mil_leadership: cstats[:mil_leadership_gen] * exp(cstats[:mil_leadership_factor]) * 12,
      treasury: cstats[:income] * exp(cstats[:income_factor]) * 12,
      stability: cstats[:stability_base],
      reputation: cstats[:reputation_base],
      prestige: cstats[:prestige_gen] * exp(cstats[:prestige_factor]) / cstats[:prestige_decay].to_f, # WARNING: Infinities can arise if decay is zero!
      technology: cstats[:technology_gen] * exp(cstats[:technology_factor]) * 240,
      culture: cstats[:culture_gen] * exp(cstats[:culture_factor]) * 240,
      unrest: cstats[:unrest_gen] * exp(cstats[:unrest_factor]) / (cstats[:unrest_decay].to_f * 2), # WARNING: Infinities can arise if decay is zero!
      manpower: 0 # TODO: Add whatever calculation is necessary whenever manpower gets done
    }
  end
end
