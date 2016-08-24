$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bitcharts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bitcharts"
  s.version     = Bitcharts::VERSION
  s.authors     = ["Sebastian Gaul"]
  s.email       = ["sebastian@mgvmedia.com"]
  s.homepage    = "https://github.com/Lichtbit/bitcharts"
  s.summary     = "Charts for Rails"
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "jquery-rails"
  s.add_dependency "coffee-rails"

  s.add_development_dependency "sqlite3"
end
