# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_producer_service/version'

Gem::Specification.new do |spec|
  spec.name          = 'aemmobile-sdk'
  spec.version       = ContentProducerService::VERSION
  spec.authors       = ['Andrew Porter']
  spec.email         = ['andrew.porter@wavetronix.com']

  spec.summary       = %q(This gem contains code to call Adobe's DPS Content Producer Service APIs with Ruby.)
  spec.description   = %q(This gem contains code to call Adobe's DPS Content Producer Service APIs with Ruby.)
  spec.homepage      = 'http://wavetronix.github.io/aemmobile-sdk-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'

  spec.add_dependency 'httparty'
  spec.add_dependency 'json'
end
