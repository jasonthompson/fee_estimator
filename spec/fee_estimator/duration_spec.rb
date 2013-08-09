require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/duration'

describe FeeEstimator::Duration do
  it "takes minutes and returns hours + minutes" do
    FeeEstimator::Duration.new(400).to_hours.must_equal [6, 40]
  end

  describe :round do
    it "rounds to the nearest 15 minutes" do
      FeeEstimator::Duration.new(400).round.must_equal [6, 45]
      FeeEstimator::Duration.new(125).round.must_equal [2, 15]
      FeeEstimator::Duration.new(152).round.must_equal [2, 30]
    end
  end
end
