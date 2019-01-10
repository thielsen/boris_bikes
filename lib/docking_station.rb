# lib/docking_station.rb
require './lib/bike'

class DockingStation
  attr_reader :docked_bikes

DEFAULT_CAPACITY = 20

def initialize(docked_bikes = Array.new)
  @docked_bikes = docked_bikes
end

  def release_bike
    fail "No bikes!" if empty? == true
    @docked_bikes.pop
  end

  def dock(bike)
    fail "I'm full!" if full? == true
    @docked_bikes.push(bike)
  end

private

  def full?
   true if @docked_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    true if @docked_bikes.count == 0
  end
end
