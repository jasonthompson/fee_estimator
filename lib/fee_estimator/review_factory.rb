require 'duration'
require 'ostruct'

module FeeEstimator
  class ReviewFactory
    def self.create(args)
      page_count = args[:page_count] || args[:size]

      OpenStruct.new(unit: args[:unit],
                     size: args[:size],
                     duration: args[:duration],
                     page_count: page_count,
                     pages_requiring_redaction: args[:pages_requiring_redaction])
    end
  end
end
