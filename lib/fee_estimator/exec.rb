require_relative 'search_estimator'
require_relative 'review_factory'
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
        sample = ReviewFactory.create(:size => params['page_count'].value,
                                      :duration => params['duration'].value,
                                      :pages_requiring_redaction => params['pages_requiring_redaction'].value)

        actual = ReviewFactory.create(:size => params['actual_page_count'].value)

        estimate = FeeEstimator::SearchEstimator.new(:sample => sample, 
                                                     :actual => actual)

        e = sprintf("%.2f", estimate.estimate)
        p "$" + e
      end
    }
  end
end
