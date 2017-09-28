
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gvive/version"

Gem::Specification.new do |spec|
  spec.name          = "gvive"
  spec.version       = GVIVE::VERSION
  spec.authors       = ["Alfred Rowe"]
  spec.email         = ["alfred@encodevlabs.com"]

  spec.summary       = %q{GVIVE Ruby SDK}
  spec.description   = %q{Identity Theft Protection SDK for GVIVE Web Service}
  spec.homepage      = "https://github.com/nukturnal/gvive"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0.0"
  spec.add_dependency "http", "~> 2.0"
end
