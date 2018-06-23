require_relative 'world'
require_relative 'modifiable'
require_relative 'country_defaults'

class Country < Modifiable
  attr_reader :tag # localization and country name
  attr_accessor :gov_type # :democracy, :monarchy, :socialist, :capitalist, :nationalist
  attr_accessor :flag # path to national flag
  attr_accessor :color # map color

  @@defaults = CountryDefaults

  def initialize(tag, world:, flag: nil, color: "#000000", gov_type: :monarchy)
    if world.countries.select{|c| c.tag == tag}.any?
      raise "country tag #{tag} exists already!"
    end
    @tag = tag
    @flag = flag
    @color = color
    super(world)
  end

  def to_s
    @tag.to_s
  end

  def to_sym
    @tag.to_sym
  end
end
