require 'date'
require 'set'

class World
  attr_accessor :countries # Contains a list of all countries in this world
  attr_accessor :date # Date can be changed, but this should be avoided most of the time
  def initialize(date: Date.new(1898, 7))
    @countries = Set[]
    @date = date
    # TODO: Import history files for the given date
  end
  def add_country(*args, **kw_args)
    @countries.add(Country.new(*args, **kw_args, world: self))
  end
  def monthly_tick
    @date = @date.next_month
    @countries.each do |country|
      country.monthly_tick
      country.yearly_tick if date.month == 1
    end
  end
  def tag2country(tag)
    @countries.select{ |c| c.tag == tag }.sample
  end
end
