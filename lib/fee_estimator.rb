require_relative 'fee_estimator/search_estimator'
require 'ostruct'
require 'optparse'

module FeeEstimator
  class Exec
    def self.parse(args)
      options = {}

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: fee_estimator [options]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options[:verbose] = v
        end
      end 
      
      opt_parser.parse!(args)
      options
    end
    
  end
end

options = FeeEstimator::Exec.parse(ARGV)

sample_review = OpenStruct.new(size: 200, 
                               unit: :page, 
                               page_count: 300, 
                               duration: 30, 
                               pages_per_unit: 1.5, 
                               pages_requiring_redaction: 40)

actual_review = OpenStruct.new(size: 1000, 
                               unit: :page, 
                               page_count: 1000)

fe = FeeEstimator::SearchEstimator.new(:sample => sample_review,
                                       :actual => actual_review)
details = fe.estimate_details

details.each do |detail|
  k,v = detail
  p "#{k} = #{v}"
end
p ARGV

