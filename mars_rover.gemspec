# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mars_rover/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamie English"]
  gem.email         = ["jamienglish@gmail.com"]
  gem.description   = %q{Mars Rover Programming Problem}
  gem.summary       = %q{Programming problem from ThoughtWorks as part of job application process.}
  #gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mars-rover"
  gem.require_paths = ["lib"]
  gem.version       = MarsRover::VERSION

  gem.add_development_dependency("rake")
  gem.add_development_dependency("cucumber", "~> 1.1.9")
  gem.add_development_dependency("rspec", "~> 2.8.0")
  gem.add_development_dependency("aruba", "~> 0.4.11")
  gem.add_development_dependency("guard-rspec", "~> 0.6.0")
  gem.add_development_dependency("guard-cucumber", "~> 0.7.5")
  gem.add_development_dependency("ruby_gntp", "~> 0.3.4")
  gem.add_development_dependency("simplecov", "~> 0.6.2")
end
