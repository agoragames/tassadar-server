# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tassadar-server/version'

Gem::Specification.new do |gem|
  gem.name          = 'tassadar-server'
  gem.version       = Tassadar::Server::VERSION
  gem.authors       = ['Logan Koester']
  gem.email         = ['logan@logankoester.com']
  gem.description   = %q{A web service interface to the tassadar Starcraft 2 replay parser}
  gem.summary       = %q{A web service interface to the tassadar Starcraft 2 replay parser}
  gem.homepage      = 'https://github.com/agoragames/tassadar-server'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'grape'
  gem.add_dependency 'tassadar'
end
