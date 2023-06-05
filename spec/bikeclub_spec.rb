require 'rspec'
require 'pry'
require './lib/ride'
require './lib/bikers'
require './lib/bikeclub'

RSpec.describe Bikeclub do
    before(:each) do
        @club = Bikeclub.new("Hogs Head")
        @biker = Bikers.new("Kenny", 30.7)
        @biker2 = Bikers.new("Athena", 35.1)
        @biker3 = Bikers.new("Mack", 60.0)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        @biker.learn_terrain!(:gravel)        
        @biker.learn_terrain!(:hills)        
        @biker2.learn_terrain!(:gravel)        
        @biker2.learn_terrain!(:hills)        
        @biker3.learn_terrain!(:gravel)        
        @biker3.learn_terrain!(:hills)        
    end

    it 'exists and has a name' do
        expect(@club).to be_a(Bikeclub)
        expect(@club.name).to eq("Hogs Head")
    end

    it 'starts with an empty hash? of bikers' do
        expect(@club.members).to eq([])
    end

    it 'can add new members to the club' do
        @club.add_member(@biker3)

        expect(@club.members).to eq([@biker3])
    end

    it 'can tell who has logged the most rides' do
        @club.add_member(@biker)
        @club.add_member(@biker2)
        @club.add_member(@biker3)

        @biker.log_ride(@ride1, 70)
        @biker.log_ride(@ride2, 40)
        @biker.log_ride(@ride2, 67)

        @biker2.log_ride(@ride2, 80)
        @biker2.log_ride(@ride1, 79)
        
        @biker3.log_ride(@ride1, 70)
        @biker3.log_ride(@ride2, 64)
        @biker3.log_ride(@ride2, 30)
        @biker3.log_ride(@ride1, 80)

        expect(@club.most_rides).to eq(@biker3.name)
    end
end