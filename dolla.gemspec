
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dolla/version"

Gem::Specification.new do |spec|
  spec.name          = "dolla"
  spec.version       = Dolla::VERSION
  spec.authors       = ["Enrique Vidal", "David Sanchez", "Carlos Muniz"]
  spec.email         = ["enrique@cloverinteractive.com", "sanchez.dav90@gmail.com", "mumo.crls@gmail.com"]

  spec.summary       = %q{Dolla module for payment gateways.}
  spec.description   = %q{Dolla is a gem that provide payments methods for bank gateways.}
  spec.homepage      = "https://github.com/amco/dolla."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.1"
  spec.add_development_dependency "factory_bot"
  spec.add_development_dependency "timecop"
  spec.add_runtime_dependency "activerecord"
  spec.add_dependency 'symbolize'
  spec.add_dependency 'rails'
  spec.add_dependency 'ruby-hmac'
  spec.add_dependency 'crypt19-rb'
  spec.add_dependency 'savon', "~> 0.9.14"
end
