# spec/boris_bikes_spec.rb
require 'docking_station'

RSpec.describe DockingStation do

context 'when in any state' do
  before(:all) do
    @biketest = Bike.new
    @station = described_class.new
    @station.dock(@biketest)
  end
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock }
  it { expect(@station.docked_bikes[0]).to eq @biketest }
  it { expect(@station.docked_bikes[0]).to be_an_instance_of(Bike) }
end

context 'when docking station full' do
  before(:all) do
    @fullstation = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { @fullstation.dock(Bike.new) }
  end
  it { expect { @fullstation.dock(Bike.new) }.to raise_error("I'm full!") }
 end

context 'when docking station empty' do
  before(:all) do
    @emptystation = described_class.new
  end
  it { expect { @emptystation.release_bike }.to raise_error('No bikes!') }
  #it { is_expected.to have_attributes(:docked_bikes => [], :capacity => DockingStation::DEFAULT_CAPACITY)}
  it { expect(@emptystation.instance_variable_get(:@capacity)).to eq DockingStation::DEFAULT_CAPACITY }
end

context 'when setting capacity' do
  before(:all) do
    @bigstation = described_class.new([], 21)
    21.times { @bigstation.dock(Bike.new) }
  end
  it { expect(@bigstation.instance_variable_get(:@capacity)).to eq 21 }
  it { expect { @bigstation.dock(Bike.new) }.to raise_error("I'm full!") }
end
end
