# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "analogbridge/version"

Gem::Specification.new do |spec|
  spec.name          = "analogbridge"
  spec.version       = Analogbridge::VERSION
  spec.authors       = ["Analog Bridge"]
  spec.email         = ["support@analogbridge.io"]

  spec.summary       = %q{The Ruby Interface to the Analog Bridge API}
  spec.description   = %q{The Ruby Interface to the Analog Bridge API}
  spec.homepage      = "https://github.com/analogbridge/analog-bridge-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.0"
end