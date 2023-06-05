require 'rspec'
require 'pry'
require './lib/ride'
require './lib/bikers'

RSpec.describe Bikers do
    before(:each) do
        @biker = Bikers.new("Kenny", 30)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    it 'exists and has attributes' do
        expect(@biker).to be_a(Bikers)
        expect(@biker.name).to eq("Kenny")
        expect(@biker.max_distance).to eq(30)
    end

    it 'starts with an empty hash of rides' do
        expect(@biker.rides).to eq({})
    end

    it 'starts with an empty list of acceptable terrain' do
        expect(@biker.acceptable_terrain).to eq([])
    end

    it 'can learn new terrain' do
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)

        expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end

    it 'can log a ride if the terrain is acceptable and add it to ride count' do
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)

        expect(@biker.acceptable_terrain).to eq([:gravel, :hills])

        @biker.log_ride(@ride1, 92.5)
        @biker.log_ride(@ride1, 91.1)
        @biker.log_ride(@ride2, 60.9)
        @biker.log_ride(@ride2, 61.6)

        expect(@biker.rides).to be_a(Hash)
        expect(@biker.ride_count).to eq(4)
    end

    it 'keeps track of personal records' do
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)

        @biker.log_ride(@ride1, 92.5)
        @biker.log_ride(@ride1, 91.1)
        @biker.log_ride(@ride2, 60.9)
        @biker.log_ride(@ride2, 61.6)

        expect(@biker.personal_record(@ride1)).to eq(91.1)
        expect(@biker.personal_record(@ride2)).to eq(60.9)
    end

    it 'can do all the same stuff with a new biker' do
        biker2 = Bikers.new("Athena", 15)

        biker2.log_ride(@ride1, 97.0)
        biker2.log_ride(@ride2, 67.0)
        expect(biker2.rides).to eq({})

        biker2.learn_terrain!(:gravel)
        biker2.learn_terrain!(:hills)

        biker2.log_ride(@ride1, 95.0)
        biker2.log_ride(@ride2, 65.0)

        expect(biker2.rides).to be_a(Hash)

        expect(biker2.personal_record(@ride2)).to eq(65.0)
        expect(biker2.personal_record(@ride1)).to eq(false)
    end
end