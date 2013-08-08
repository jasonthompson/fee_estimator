require 'duration'

module FeeEstimator
  class Review
    attr_reader :unit, :size, :duration, :page_count, :pages_requiring_redaction
    
    def initialize(args)
      @unit = args[:unit]
      @size = args[:size]
      @duration = Duration.new(args[:duration])
      @page_count = set_page_count(args[:page_count])
      @pages_requiring_redaction = args[:pages_requiring_redaction]
    end

    def set_page_count(pages)
      if pages.nil?
        size
      else
        pages
      end
    end

    def pages_per_unit
      page_count / size.to_f
    end
  end
end
