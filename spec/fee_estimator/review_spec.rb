require_relative '../spec_helper'
require_relative '../../lib/fee_estimator/review'

describe FeeEstimator::ReviewFactory do

  sample_page_params = {:unit => :page, 
                        :size => 200, 
                        :duration => 30, 
                        :pages_requiring_redaction => 40}
  sample_email_params = {:unit => :email, 
                         :size => 200, 
                         :duration => 30, 
                         :page_count => 300, 
                         :pages_requiring_redaction => 40}
  
  let(:pages_sample){FeeEstimator::ReviewFactory.new(sample_page_params)}
  let(:emails_sample){FeeEstimator::ReviewFactory.new(sample_email_params)}
  
  describe :pages_per_unit do
    it "returns the pages per unit" do
      emails_sample.pages_per_unit.must_equal 1.5
    end

    describe "when :unit = :pages" do
      it "is the same as size" do
        pages_sample.pages_per_unit.must_equal 1
      end
    end
  end
end
