$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bitcharts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bitcharts"
  s.version     = Bitcharts::VERSION
  s.authors     = ["Sebastian Gaul"]
  s.email       = ["sebastian.gaul@lichtbit.com"]
  s.homepage    = "https://github.com/Lichtbit/bitcharts"
  s.summary     = "Charts for Rails"
  s.description = "Solid chart framework to use Chart.js with Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "jquery-rails", "~> 4"
  s.add_dependency "coffee-rails", "~> 4.1"

  s.add_development_dependency "sqlite3", "~> 1.3"
end
