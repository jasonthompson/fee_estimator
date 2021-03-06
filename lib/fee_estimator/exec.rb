require 'ostruct'
require 'main'
require 'fee_estimator/search_estimator'
require 'fee_estimator/preparation_estimator'
require 'fee_estimator/reporter'
require 'fee_estimator/review_factory'


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

        search = FeeEstimator::SearchEstimator.new(:sample => sample, 
                                                   :actual => actual)

        preparation = FeeEstimator::PreparationEstimator.new(:sample => sample,
                                                             :actual => actual)

        FeeEstimator::Reporter.new(search, :search).render
        FeeEstimator::Reporter.new(preparation, :preparation).render
        #FeeEstimator::Reporter.new(preparation).total

      end
    }
  end
end
