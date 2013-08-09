module FeeEstimator
  module Calculations
    def to_hours(mins)
      (mins / 60.0 * 100).round / 100
    end

    def to_currency(num)
      (num * 100).round(2) / 100.0
    end
  end
end
