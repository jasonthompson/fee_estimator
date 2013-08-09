module FeeEstimator
  class Duration
    attr_reader :minutes

    QUARTERS = [15, 30, 45, 60]

    def initialize(minutes)
      @minutes = minutes
    end

    def to_hours
      [fetch_hours, fetch_minutes]
    end

    def round
      [fetch_hours, round_minutes]
    end

    private 

    def fetch_minutes
      minutes.modulo(60)
    end

    def fetch_hours
      minutes / 60
    end

    def round_minutes
      nearest_quarter = 15

      if distance_from_quarter > 7 && fetch_minutes < 15
        nearest_quarter = fetch_minutes + (15 - distance_from_quarter)
      else
        nearest_quarter = fetch_minutes - distance_from_quarter
      end

      nearest_quarter
    end

    def distance_from_quarter
      fetch_minutes.modulo(15)
    end
  end
end
