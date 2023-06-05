class Bikeclub
    attr_reader :name,
                :members

    def initialize(name)
        @name = name
        @members = []
    end

    def add_member(biker)
        @members << biker
    end

    def most_rides
        highest_number = 0
        @members.each do |member|
            number = member.ride_count
            highest_number = number if number > highest_number
            # return member.name if highest_number == number
            #??????/?!?!?!?!??!?!
            return highest_number
        end
    end
end