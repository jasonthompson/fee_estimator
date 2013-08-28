# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "fee_estimator"
  spec.version       = "0.0.1"
  spec.authors       = ["jasonthompson"]
  spec.email         = ["jason@jthompson.ca"]
  spec.description   = %q{Calculates the fee estimates permitted for Freedom of Information requests in Ontario.}
  spec.summary       = %q{Calculates the fee estimates permitted for Freedom of Information requests in Ontario.}
  spec.homepage      = "http://github.com/jasonthompson/fee_estimator"
  spec.license       = "MIT"

  spec.files         = ["lib/fee_estimator.rb",
			"lib/fee_estimator/estimator.rb",
			"lib/fee_estimator/calculations.rb",
			"lib/fee_estimator/fees.rb",
			"lib/fee_estimator/reporter.rb",
			"lib/fee_estimator/search_estimator.rb",
			"lib/fee_estimator/duration.rb",
			"lib/fee_estimator/exec.rb",
			"lib/fee_estimator/preparation_estimator.rb",
			"lib/fee_estimator/review_factory.rb",
			"lib/fee_estimator/search_reporter.rb"]
  spec.executables   = ["fee_estimator"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_runtime_dependency "main", "~>5.2"
end
