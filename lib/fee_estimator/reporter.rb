require "erb"

module FeeEstimator
  class Reporter
    attr_reader :total_dollars, :template

    def initialize(estimate)
      @total_dollars = (estimate.estimate)
      @template = ERB.new(get_template)
    end

    def format_total 
      sprintf("%.2f", total_dollars)
    end

    def render
      template.result(binding)
    end

    def get_template
      filename = File.expand_path("templates/text.erb")
      File.open(filename, 'rb') { |f| f.read }
    end
  end
end
