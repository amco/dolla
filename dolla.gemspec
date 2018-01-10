
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dolla/version"

Gem::Specification.new do |spec|
  spec.name          = "dolla"
  spec.version       = Dolla::VERSION
  spec.authors       = ["David Sanchez"]
  spec.email         = ["sanchez.dav90@gmail.com"]

  spec.summary       = %q{Dolla module for Agora payments.}
  spec.description   = %q{Dolla is a gem that provide all payments methods to Agora.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
  spec.add_runtime_dependency 'activerecord'
  spec.add_development_dependency 'symbolize'
  spec.add_development_dependency 'rails'
end
