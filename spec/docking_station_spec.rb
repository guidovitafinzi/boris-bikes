require 'docking_station'

describe DockingStation do

	describe "#release_bike"do
		it 'release a bike' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
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

		it "docks bikes" do
			bike = Bike.new
			expect(subject.dock(bike)).to eq [bike]
		end

		it "returns docked bikes" do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.bike).to eq bike
		end

		it 'has a default capacity' do
			expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end
	end
	
	describe "initialization" do
		subject { DockingStation.new}
		let(:bike) { Bike.new }
		it 'has a variable capacity' do
			described_class::DEFAULT_CAPACITY.times do
				subject.dock(bike)
			end
			expect{ subject.dock(bike) }.to raise_error 'Docking station full'

		end
	end
end	
