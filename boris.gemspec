# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boris/version'

Gem::Specification.new do |spec|
  spec.name          = "boris"
  spec.version       = Boris::VERSION
  spec.authors       = ["chebyte"]
  spec.email         = ["mauro@hashdog.com"]
  spec.summary       = %q{Microframework web for ruby}
  spec.description   = %q{Minimal Microframework web for ruby}
  spec.homepage      = "http://hashdog.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "rack"
end
