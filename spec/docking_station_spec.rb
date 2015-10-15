require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are not working bikes available' do
      bike = Bike.new
      subject.dock(bike,false)
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  it { is_expected.to respond_to(:dock).with(1) }

  it { is_expected.to respond_to(:bikes) }

  it 'raises error when there are no more bikes available' do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  describe 'initialization' do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
end




end