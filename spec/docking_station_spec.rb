require 'docking_station'

describe DockingStation do
	it { is_expected.to respond_to :release_bike }
	it { is_expected.to respond_to(:dock).with(1).argument }

	describe "release working bikes"do
		let(:bike) { double :bike }
		it 'release a bike' do
			allow(bike).to receive(:working?).and_return(true)
			subject.dock(bike)
			released_bike = subject.release_bike
			expect(released_bike).to be_working
		end

		it "raises an error when there are no bikes available" do
			expect {subject.release_bike}.to raise_error "No bikes available"
		end
	end

	describe "dock(bike)" do
		it "raises an error when dock is full" do
			DockingStation::DEFAULT_CAPACITY.times do
				subject.dock(Bike.new)
			end
			expect {subject.dock Bike.new}.to raise_error "Docking station full"
		end

		it 'has a default capacity' do
			expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end
	end

	describe "initialization" do
		subject { DockingStation.new}
		let(:bike) { double :bike }
		it 'has a variable capacity' do
			described_class::DEFAULT_CAPACITY.times do
				subject.dock(bike)
			end
			expect{ subject.dock(bike) }.to raise_error 'Docking station full'

		end
	end
end	
