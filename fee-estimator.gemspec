# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "fee-estimator"
  spec.version       = "0.0.1"
  spec.authors       = ["jasonthompson"]
  spec.email         = ["jason@jthompson.ca"]
  spec.description   = %q{Calculates the fee estimates permitted for Freedom of Information requests in Ontario}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = "github.com/jasonthompson/fee-estimator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
end
