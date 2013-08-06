require_relative './fees'

module FeeEstimator
  class SearchEstimator
    include FeeEstimator::Fees

    attr_reader :sample, :actual

    def initialize(sample,actual)
      @sample = sample
      @actual = actual
    end

    def estimate
      actual.page_count / sample.page_count.to_f * sample.duration / 60 * search_fee_per_hour
    end


  end
end
