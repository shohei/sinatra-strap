# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/strap/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-strap"
  spec.version       = Sinatra::Strap::VERSION
  spec.authors       = ["Shohei Aoki"]
  spec.email         = ["shoaok@gmail.com"]

  spec.summary       = %q{Sinatra app generator}
  spec.description   = %q{Sinatra and Twitter bootstrap}
  spec.homepage      = "http://github.com/shohei/sinatra-strap"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
