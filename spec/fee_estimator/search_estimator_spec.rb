require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/search_estimator'

describe FeeEstimator::SearchEstimator do
  
  Review = Struct.new(:size, :unit, :page_count, :duration, :pages_per_unit, :pages_requiring_redaction)
  sample_review = Review.new(200, :page, 300, 30, 1.5, 40)
  actual_review = Review.new(1000, :page, 1000)
  subject {FeeEstimator::SearchEstimator.new(sample_review, actual_review)}

  it "instantiates with sample and actual objects" do
    subject.must_be_instance_of FeeEstimator::SearchEstimator
  end

  describe :estimate do
    it "returns a search fee estimate" do
      subject.estimate.must_equal 50.10
    end
  end

  describe :estimate_details do
    it "returns the calculation details of the estimate" do
      details = {:fee=>50.10, 
                 :total_minutes=>100.0, 
                 :time_in_hours=>1.67, 
                 :duration=>100.0, 
                 :fee_per_hour=>30.0}
      subject.estimate_details.must_equal details
    end
  end
end
