require_relative 'fee_estimator/search_estimator'
require 'ostruct'
require 'main'

module FeeEstimator
  class Exec
    Main {
     
      keyword('page_count'){
        cast :int
        defaults 300
      }
      keyword('duration'){
        cast :int
        defaults 30
      }
      keyword('pages_requiring_redaction'){
        cast :int
      }
      keyword('actual_page_count'){
        cast :int
      }
      def run
        sample_review = OpenStruct.new(size: params['page_count'].value,
                                       unit: :page,
                                       duration: params['duration'].value,
                                       pages_requiring_redaction: params['pages_requiring_redaction'].value,
                                       page_count: 300)

        actual_review = OpenStruct.new(size: params['actual_page_count'].value,
                                       unit: :page,
                                       page_count: 1000)

        estimate = FeeEstimator::SearchEstimator.new(:sample => sample_review, :actual => actual_review)

        p estimate.estimate
      end
    }
  end
end

