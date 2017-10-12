class EventChoice
  attr_accessor :desc
  def check(country)
    true # Check if this choice is available (default: yes)
  end
  def run(country)
    # Will only be run if this choice is picked
  end
end

class Event
  attr_accessor :title
  attr_accessor :desc
  attr_accessor :choices
  def initialize(n = 1)
    @choices = Array.new(n) {EventChoice.new}
  end
  def check(country)
    true # Check if this event is possible for a given country
         # Best to make this function lightweight
  end
  def probability(country)
    0 # Return the chance that this event will occur each event tick,
      # assuming that check returns true
  end
  def immediate(country)
    # Will be run when the event is fired but before a choice is picked
  end
end
