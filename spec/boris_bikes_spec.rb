# spec/boris_bikes_spec.rb
require 'docking_station'
describe DockingStation do
  context 'DockingStation responds to method release_bike'
  it { is_expected.to respond_to :release_bike }

context 'Release bike returns a new bike'
described_class.new.release_bike
  it { is_expected.to be }
end
