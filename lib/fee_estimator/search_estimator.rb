require_relative './fees'
require_relative './calculations'

module FeeEstimator
  class SearchEstimator
    include FeeEstimator::Fees
    include FeeEstimator::Calculations

    attr_reader :actual_page_count, 
                :sample_page_count, 
                :sample_duration

    def initialize(sample,actual)
      sample = sample
      actual = actual
      @actual_page_count = actual.page_count
      @sample_page_count = sample.page_count
      @sample_duration = sample.duration
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
