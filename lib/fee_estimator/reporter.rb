require "erb"

module FeeEstimator
  class Reporter
    attr_reader :template, :search_estimate

    def initialize(estimate)
      @template = ERB.new(get_template)
      @search_estimate = estimate.estimate_details
    end

    def render
      search = search_estimate
      puts template.result(binding)
    end

    def as_currency(n)
      "$" + sprintf("%.2f", n)
    end

    private

    def get_template
      filename = File.expand_path("templates/text.erb")
      File.open(filename, 'rb') { |f| f.read }
    end
  end
end
