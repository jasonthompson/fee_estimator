require_relative "./reporter"

module FeeEstimator
  class SearchReporter < Reporter

    def total
      print "Search total: $#{format_total}"
    end

    
  end
end
