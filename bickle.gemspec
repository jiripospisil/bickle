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
end
