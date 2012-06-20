# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "selfml/version"

Gem::Specification.new do |s|
  s.name        = "selfml"
  s.version     = SelfML::VERSION
  s.authors     = ["Ricardo Mendes"]
  s.email       = ["rokusu@gmail.com"]
  s.homepage    = "http://locks.github.com/self-ml"
  s.summary     = %q{self-ml parser}
  s.description = %q{Self-ML is, as the name implies, a self-ml parser. It also has some utilities to aid in building self-ml files.}

  s.rubyforge_project = "self-ml"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.executables << 'self-ml'
  s.require_paths = ["lib"]

  s.add_development_dependency "parslet"
  s.add_development_dependency "minitest"
  s.add_development_dependency "ronn"

  s.add_runtime_dependency "parslet"
  s.add_runtime_dependency "gem-man"
end
