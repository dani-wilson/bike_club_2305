class Ride
    attr_reader     :name,
                    :distance,
                    :terrain,
                    :loop

    def initialize(info)
        @name = info[:name]
        @distance = info[:distance]
        @loop = info[:loop]
        @terrain = info[:terrain]
    end

    def loop?
        @loop
    end

    def total_distance
        if @loop == true
            return @distance
        else
            @distance * 2
        end
    end
end