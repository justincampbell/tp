# -*- encoding: utf-8 -*-

lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

require 'tp/version'

Gem::Specification.new do |gem|
  gem.name          = "tp"
  gem.version       = TP::VERSION
  gem.authors       = ["Justin Campbell"]
  gem.email         = ["justin@justincampbell.me"]
  gem.summary       = "Terminal Presenter"
  gem.description   = "Presents Markdown slides in your terminal"
  gem.homepage      = "https://github.com/justincampbell/tp"
  gem.license       = "MIT"

  gem.post_install_message = File.read('WELCOME')

  gem.files         = `git ls-files`.split $/
  gem.executables   = gem.files.grep(%r{^bin/}).map { |file| File.basename file }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency 'coderay', '~> 1.0'
  gem.add_dependency 'prawn', '~> 0.12'
  gem.add_dependency 'thor', '~> 0.17'

  gem.add_development_dependency 'cane'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
end
