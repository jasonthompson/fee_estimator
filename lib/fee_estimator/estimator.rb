require 'fee_estimator/duration'
require 'fee_estimator/fees'

module FeeEstimator
  class Estimator
    attr_reader :sample, :actual

    def initialize(args)
      @sample = args[:sample]
      @actual = args[:actual]
      post_initialize(args)
    end

    def post_initialize(args)
      nil
    end
  end
end
