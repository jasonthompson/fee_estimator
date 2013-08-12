module FeeEstimator
  class Duration < Numeric
    attr_reader :minutes, :rounding_cutoff

    def initialize(minutes, rounding_cutoff = 7)
      @minutes = minutes
      @rounding_cutoff = rounding_cutoff
    end

    def hours_minutes
      [fetch_hours, fetch_minutes]
    end

    def hours_minutes_rounded
      [fetch_hours, round_minutes]
    end
    def *(number)
      Duration.new(minutes * number)
    end

    def to_f
      fetch_hours + round_minutes / 60.0
    end

    def hours
      to_f
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

      if fetch_minutes < 15
        nearest_quarter
      elsif distance_from_quarter > rounding_cutoff
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
