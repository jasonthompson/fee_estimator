require_relative "./fees"

module FeeEstimator
  class PreparationEstimator
    include FeeEstimator::Fees

    attr_reader :sample, :actual, :minutes_per_page

    def initialize(sample,actual, minutes_per_page = 2)
      @sample = sample
      @actual = actual
      @minutes_per_page = minutes_per_page
    end

    def estimate
      preparation_time 
    end

    def preparation_time
      actual.pages_requiring_redaction
    end
  end
end
