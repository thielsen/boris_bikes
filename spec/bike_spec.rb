# spec/bike_spec.rb
require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
  it { expect(Bike.new.working?).to be true}
end
