class Bikers
    attr_reader :name,
                :max_distance,
                :rides,
                :acceptable_terrain,
                :ride_count

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
        @ride_count = 0
    end

    def learn_terrain!(terrain)
        @acceptable_terrain << terrain
    end

    def log_ride(ride, time)
        if @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
            @ride_count += 1
            if @rides.include?(ride)
                @rides[ride] << time
            else @rides[ride] = [time]
            end
        end
    end
    
    def personal_record(ride)
        if !@rides.include?(ride)
            return false
        else
        @rides[ride].min
        end
    end
end