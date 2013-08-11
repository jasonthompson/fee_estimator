require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/preparation_estimator'
require 'ostruct'

describe FeeEstimator::PreparationEstimator do
   
  sample_review = OpenStruct.new(size: 200, 
                                 unit: :page, 
                                 page_count: 200, 
                                 duration: 30, 
                                 pages_requiring_redaction: 40,
                                 pages_requiring_redaction_percentage: 20)
  
  actual_review = OpenStruct.new(size: 1000,
                                 unit: :page, 
                                 page_count: 1000)

  subject { FeeEstimator::PreparationEstimator.new(:sample => sample_review, 
                                                   :actual => actual_review)}

  it "instantiates with sample and actual objects" do
    subject.must_be_instance_of FeeEstimator::PreparationEstimator
  end

  describe :estimate do
    it "returns a search fee estimate" do
      subject.estimate.must_equal 202.50
    end
  end

  describe :estimate_pages_requiring_redaction do
    it "returns estimate of number of pages requiring redaction" do
      subject.estimate_pages_requiring_redaction.must_equal 200
    end
  end
end
