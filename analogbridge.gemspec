# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "analogbridge/version"

Gem::Specification.new do |spec|
  spec.name          = "analogbridge"
  spec.version       = AnalogBridge::VERSION
  spec.authors       = ["Eugene Gekhter", "Abu Nashir"]
  spec.email         = ["eg@gomemorable.com", "abunashir@gmail.com"]

  spec.summary       = %q{Import any analog media format into your cloud app}
  spec.description   = %q{Enable users to import any analog media format directly into your app with the Analog Bridge API}
  spec.homepage      = "https://analogbridge.io"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.required_ruby_version = Gem::Requirement.new(">= 2.1.9")

  spec.add_dependency "rest-client", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
end
