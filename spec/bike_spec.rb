require 'bike'
describe Bike do
	it "respods to working?" do
		expect(subject).to respond_to :working?
	end
end