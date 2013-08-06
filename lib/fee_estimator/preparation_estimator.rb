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

    def estimate_pages_requiring_redaction
      sample.pages_requiring_redaction_percentage.to_f * actual.page_count / 100
    end

    def estimate
      estimate_pages_requiring_redaction * minutes_per_page / 60 * preparation_fee_per_hour
    end

 end
end
