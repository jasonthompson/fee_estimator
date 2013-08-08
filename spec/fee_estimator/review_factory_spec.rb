require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/review_factory'

describe FeeEstimator::ReviewFactory do

  sample_page_params = {:unit => :page, 
                        :size => 200, 
                        :page_count => nil,
                        :duration => 30, 
                        :pages_requiring_redaction => 40}

   before do
     @sample = FeeEstimator::ReviewFactory.create(sample_page_params)
   end
  
  describe :create do

    it "returns a review object" do
      @sample[:unit].must_equal :page
    end
  end

  describe :page_count do
    it "returns correct page count" do
      @sample[:page_count].must_equal 200
    end
  end
end
