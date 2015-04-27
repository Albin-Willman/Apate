# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apate/version'

Gem::Specification.new do |spec|
  spec.name          = "apate"
  spec.version       = Apate::VERSION
  spec.authors       = ["Albin Svensson"]
  spec.email         = ["albin.svensson@trialbee.com"]
  spec.summary       = %q{Provide tools for statistics computation.}
  spec.description   = %q{Provide tools to be used when making statistical computations.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  
  spec.add_development_dependency 'bundler',      '~> 1.5'
  spec.add_development_dependency 'rake',         '~> 10.0'
  spec.add_development_dependency 'rspec',        '~> 3.2'
  spec.add_development_dependency 'simplecov',    '~> 0.7'
  spec.add_development_dependency 'guard',        '~> 2.12'
  spec.add_development_dependency 'guard-rspec',  '~> 4.5'

end
