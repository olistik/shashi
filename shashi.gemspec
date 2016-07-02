# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shashi/version'

Gem::Specification.new do |spec|
  spec.name          = "shashi"
  spec.version       = Shashi::VERSION
  spec.authors       = ["Maurizio De Magnis"]
  spec.email         = ["root@olisti.co"]

  spec.summary       = %q{Store and fetch data from a JSON file using the command line.}
  spec.homepage      = "https://github.com/olistik/shashi"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
