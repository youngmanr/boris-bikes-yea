require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  it { is_expected.to respond_to :release_bike }

  it 'releases a bike' do
    allow(bike).to receive(:working=).with(true).and_return(true)
    allow(bike).to receive(:working?).and_return(true)
    subject.dock bike
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'raises an error when there are not working bikes available' do
    allow(bike).to receive(:working=).with(false).and_return(false)
    allow(bike).to receive(:working?).and_return(false)
    subject.dock bike, false
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it { is_expected.to respond_to(:dock).with(1) }

  it { is_expected.to respond_to(:bikes) }

  it 'raises error when there are no more bikes available' do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it 'defaults capacity' do
    allow(bike).to receive(:working=).with(true).and_return(true)
    described_class::DEFAULT_CAPACITY.times do
      subject.dock bike
    end
    expect{ subject.dock bike }.to raise_error 'Docking station full'
  end
end