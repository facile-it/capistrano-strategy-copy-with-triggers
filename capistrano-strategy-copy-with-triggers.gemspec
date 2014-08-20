# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "capistrano-strategy-copy-with-triggers"
  s.version     = 1.4
  s.authors     = ["Luca Bo @ facile.it"]

  s.homepage    = "http://github.com/facile-it/capistrano-strategy-copy-with-triggers"
  s.summary     = %q{Capistrano copy strategy to transfer files with triggers}
  s.description = %q{Same as copy strategy, but with events triggers}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "capistrano", "~> 2"
end
