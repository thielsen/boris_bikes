# spec/boris_bikes_spec.rb
require 'docking_station'

RSpec.describe DockingStation do



context 'In all states' do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock }
  #it { is_expected.to respond_to :full? }
  #it { is_expected.to respond_to :empty? }
end

context 'Docking station full' do
  before(:each) do
    @fullstation = described_class.new
    DockingStation::DEFAULT_CAPACITY.times { @fullstation.dock(Bike.new) }
  end
  it { expect { @fullstation.dock(Bike.new) }.to raise_error("I'm full!") }
  #it { expect(@fullstation.full?).to be true }
 end

context 'Docking station empty' do
  before(:each) do
    @emptystation = described_class.new
  end
  it { expect { @emptystation.release_bike }.to raise_error('No bikes!') }
  #it { expect(@emptystation.empty?).to be true }
end

context 'Docking station neither full nor empty' do
  before(:each) do
    @biketest = Bike.new
    @station = described_class.new
    @station.dock(@biketest)
  end
  it { expect(@station.docked_bikes[0]).to eq @biketest }
  it { expect(@station.docked_bikes[0]).to be_an_instance_of(Bike) }
end





# xcontext 'Release bike returns a new bike' do
#    bike = described_class.new.release_bike
#    it { is_expected.to be_working}
# end
end
