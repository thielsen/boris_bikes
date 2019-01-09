# lib/docking_station.rb
require './lib/bike'

class DockingStation
  def release_bike
    Bike.new
  end
end
