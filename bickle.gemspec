# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bickle/version'

Gem::Specification.new do |gem|
  gem.name          = "bickle"
  gem.version       = Bickle::VERSION
  gem.authors       = ["Jiri Pospisil"]
  gem.email         = ["mekishizufu@gmail.com"]
  gem.description   = %q{Bickle is a tool to display your build status from your terminal.}
  gem.summary       = %q{Bickle is a tool to display your build status from your terminal.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rest-client", "~> 1.6.7"
  gem.add_dependency "json", "~> 1.7.5"

  gem.add_development_dependency "rake", "~> 0.9.2"
  gem.add_development_dependency "guard", "~> 1.5.4"
  gem.add_development_dependency "rb-inotify", "~> 0.8.8"
  gem.add_development_dependency "guard-rspec", "~> 2.1.2"
  gem.add_development_dependency "rspec", "~> 2.11.0"
  gem.add_development_dependency "pry", "~> 0.9.10"
  gem.add_development_dependency "pry-nav", "~> 0.2.2"
end
