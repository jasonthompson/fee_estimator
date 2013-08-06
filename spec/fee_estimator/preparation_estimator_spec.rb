require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/preparation_estimator'

describe FeeEstimator::PreparationEstimator do
  
  Review = Struct.new(:size, :unit, :page_count, :duration, 
                      :pages_per_unit, :pages_requiring_redaction, 
                      :pages_requiring_redaction_percentage)

  sample_review = Review.new(200, :page, 200, 30, 1.5, 40, 20)
  actual_review = Review.new(1000, :page, 1000)
  subject {FeeEstimator::PreparationEstimator.new(sample_review, 
                                                  actual_review)}

  it "instantiates with sample and actual objects" do
    subject.must_be_instance_of FeeEstimator::PreparationEstimator
  end

  describe :estimate do
    it "returns a search fee estimate" do
      subject.estimate.must_equal 200
    end
  end
end
