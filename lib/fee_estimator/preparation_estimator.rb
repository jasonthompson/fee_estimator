require_relative "./estimator"
require_relative "./fees"
require_relative "./calculations"

module FeeEstimator
  class PreparationEstimator < Estimator
    include FeeEstimator::Fees
    include FeeEstimator::Calculations

    attr_reader :minutes_per_page,
                :sample_pages_requiring_redaction_percentage,
                :actual_page_count

    def post_initialize(args)
      @sample_pages_requiring_redaction_percentage = 
        args[:sample].pages_requiring_redaction_percentage
      @actual_page_count = args[:actual].page_count
      @minutes_per_page = 2
    end


    def estimate
       to_hours(estimate_duration) * preparation_fee_per_hour
    end

    def estimate_with_details
      {:fee => estimate.round(2), 
       :minutes_per_page => minutes_per_page,
       :total_minutes => estimate_duration,
       :time_in_hours => to_hours(estimate_duration),
       :duration => estimate_duration,
       :fee_per_hour => preparation_fee_per_hour}
    end
    
    def estimate_pages_requiring_redaction
      sample_pages_requiring_redaction_percentage * 
        actual_page_count / 100
    end

    def estimate_duration
      estimate_pages_requiring_redaction * minutes_per_page
    end
 end
end
