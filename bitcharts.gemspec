$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bitcharts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bitcharts"
  s.version     = Bitcharts::VERSION
  s.authors     = ["Sebastian Gaul"]
  s.email       = ["sebastian@mgvmedia.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Bitcharts."
  s.description = "TODO: Description of Bitcharts."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "sqlite3"
end
