# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ree/version'

Gem::Specification.new do |spec|
  spec.name          = "Ree"
  spec.version       = Ree::VERSION
  spec.authors       = ["沈汪洋"]
  spec.email         = ["541991a@gmail.com"]
  spec.summary       = %q{Ree}
  spec.description   = %q{a little framework for ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "rack"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
