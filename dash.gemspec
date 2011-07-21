# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dash/version"

Gem::Specification.new do |s|
  s.name        = "dash"
  s.version     = Dash::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael McClenaghan"]
  s.email       = ["mike@shift81.com"]
  s.homepage    = "https://github.com/shift81/dash"
  s.summary     = %q{Strong password generator}
  s.description = %q{Generates a strong password that is simple to recreate so there is no need to ever store your passwords.}

  s.rubyforge_project = "dash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('clamp')
  s.add_development_dependency "rspec", "~> 2.6"
end
