# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunspot_with_kaminari/version"

Gem::Specification.new do |s|
  s.name        = "jake3030-sunspot_with_kaminari"
  s.version     = SunspotWithKaminari::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jake Varghese"]
  s.email       = ["jake@flvorful.com"]
  s.homepage    = "https://github.com/jake3030/sunspot_with_kaminari"
  s.summary     = %q{Pagination with kaminari for sunspot with support for paginatablearray}
  s.description = %q{Extends sunspot to be compatible with kaminari for pagination}

  s.rubyforge_project = "sunspot_with_kaminari"
  
  s.add_dependency 'sunspot_rails'
  s.add_dependency 'kaminari'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
