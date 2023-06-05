require 'rspec'
require 'pry'
require './lib/ride'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    end

    it 'exists and has attributes' do
        expect(@ride1).to be_a(Ride)
        expect(@ride1.name).to eq("Walnut Creek Trail")
        expect(@ride1.distance).to eq(10.7)
        expect(@ride1.terrain).to eq(:hills)
    end

    it 'can indicate if the ride is a loop or not' do
        expect(@ride1.loop?).to eq(false)
    end

    it 'can report total distance' do
        expect(@ride1.total_distance).to eq(21.4)
    end

    it 'can test loop and total distance of a new ride' do
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        expect(ride2.loop?).to eq(true)
        expect(ride2.total_distance).to eq(14.9)
    end
end