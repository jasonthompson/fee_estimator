require_relative './estimator'
require_relative './fees'
require_relative './calculations'

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
      to_currency(to_hours(estimate_duration) * search_fee_per_hour)
    end

    def estimate_details
      {:fee => estimate, 
       :total_minutes => estimate_duration,
       :time_in_hours => to_hours(estimate_duration),
       :duration => estimate_duration,
       :fee_per_hour => preparation_fee_per_hour}
    end

    def estimate_duration
      actual_page_count / sample_page_count.to_f * sample_duration
    end
  end
end
