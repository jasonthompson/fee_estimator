require_relative './duration'
require 'ostruct'

module FeeEstimator
  class ReviewFactory
    def self.create(args)
      page_count = args[:page_count] || args[:size]

      pages_requiring_redaction_percentage = args[:pages_requiring_redaction] / page_count if args[:pages_requiring_redaction]

      OpenStruct.new(unit: args[:unit],
                     size: args[:size],
                     duration: args[:duration],
                     page_count: page_count,
                     pages_requiring_redaction: args[:pages_requiring_redaction],
                     pages_requiring_redaction_percentage: pages_requiring_redaction_percentage)
    end
  end
end
