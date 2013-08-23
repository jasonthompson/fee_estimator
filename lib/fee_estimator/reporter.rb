require "erb"

module FeeEstimator
  class Reporter
    attr_reader :template, :estimate, :template_name

    def initialize(estimate, template_name)
      @template_name = template_name
      @template = ERB.new(get_template)
      @estimate = estimate.estimate_details
    end

    def render
      puts template.result(binding)
    end

    def as_currency(n)
      "$" + sprintf("%.2f", n)
    end

    private

    def template_file
      File.expand_path("templates/" + template_name.to_s + ".erb")
    end

    def get_template
      File.open(template_file, 'rb') { |f| f.read }
    end
  end
end
