module FeeEstimator
  class Reporter
    attr_reader :total_dollars

    def initialize(estimate)
      @total_dollars = (estimate.estimate)
    end

    def total 
      p "Search Total: $" + sprintf("%.2f", total_dollars)
    end
  end
end
