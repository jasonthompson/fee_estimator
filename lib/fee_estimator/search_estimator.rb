require_relative './estimator'
require_relative './fees'
require_relative './calculations'
require_relative './duration'

module FeeEstimator
  class SearchEstimator < Estimator
    include FeeEstimator::Fees
    include FeeEstimator::Calculations

    attr_reader :actual_page_count, 
                :sample_page_count, 
                :sample_duration

    def post_initialize(args)
      @actual_page_count = args[:actual].page_count
      @sample_page_count = args[:sample].page_count
      @sample_duration = args[:sample].duration
    end

    def estimate
      estimate_duration.hours * search_fee_per_hour
    end

    def estimate_details
      {:fee => estimate, 
       :time_in_hours => estimate_duration.hours,
       :time_in_minutes => estimate_duration.minutes,
       :fee_per_hour => preparation_fee_per_hour}
    end

    def estimate_duration
      Duration.new(sample_duration * (actual_page_count / sample_page_count))
    end
  end
end
