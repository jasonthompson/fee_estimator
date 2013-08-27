module FeeEstimator
  class PreparationEstimator < Estimator
    include FeeEstimator::Fees
    include FeeEstimator::Calculations

    attr_reader :minutes_per_page,
                :sample_pages_requiring_redaction_percentage,
                :actual_page_count,
                :duration_klass

    def post_initialize(args)
      @sample_pages_requiring_redaction_percentage = 
        args[:sample].pages_requiring_redaction_percentage
      @actual_page_count = args[:actual].page_count
      @minutes_per_page = 2
      @duration_klass = Duration
    end


    def estimate
       estimate_duration * preparation_fee_per_hour
    end

    def estimate_details
      {:total => estimate.round(2), 
       :minutes_per_page => minutes_per_page,
       :time_in_hours => estimate_duration,
       :duration => estimate_duration,
       :fee_per_hour => preparation_fee_per_hour}
    end
    
    def estimate_pages_requiring_redaction
      sample_pages_requiring_redaction_percentage * 
        actual_page_count / 100
    end

    def estimate_duration
      mins = estimate_pages_requiring_redaction * minutes_per_page
      duration_klass.new(mins).to_f
    end
 end
end
