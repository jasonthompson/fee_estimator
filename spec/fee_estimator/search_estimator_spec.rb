require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/search_estimator'
require 'ostruct'

describe FeeEstimator::SearchEstimator do
  
  sample_review = OpenStruct.new(size: 200, 
                                 unit: :page, 
                                 page_count: 300, 
                                 duration: 30, 
                                 pages_per_unit: 1.5, 
                                 pages_requiring_redaction: 40)

  actual_review = OpenStruct.new(size: 1000, 
                                 unit: :page, 
                                 page_count: 1000)

  subject {FeeEstimator::SearchEstimator.new(:sample => sample_review, 
                                             :actual => actual_review)}

  it "instantiates with sample and actual objects" do
    subject.must_be_instance_of FeeEstimator::SearchEstimator
  end

  describe :estimate do
    it "returns a search fee estimate" do
      subject.estimate.must_equal 45.00
    end
  end

  describe :estimate_details do
    it "returns the calculation details of the estimate" do
      details = {:total=>45.00, 
                 :time_in_hours=>1.5, 
                 :fee_per_hour=>30.0}
      subject.estimate_details.must_equal details
    end
  end
end
