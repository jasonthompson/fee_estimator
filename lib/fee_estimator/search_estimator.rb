require 'fee_estimator/estimator'
require 'fee_estimator/duration'
require 'fee_estimator/fees'


module FeeEstimator
  class SearchEstimator < Estimator
    include FeeEstimator::Fees

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
      {:total => estimate, 
       :time_in_hours => estimate_duration.hours,
       :fee_per_hour => preparation_fee_per_hour}
    end

    def estimate_duration
      Duration.new(sample_duration * (actual_page_count / sample_page_count))
    end
  end
end
