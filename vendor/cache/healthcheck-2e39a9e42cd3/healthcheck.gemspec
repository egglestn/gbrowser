# -*- encoding: utf-8 -*-
# stub: healthcheck 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "healthcheck".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Asfand Qazi".freeze, "Lee-Jon Ball".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-11-29"
  s.email = ["ayqazi@gmail.com".freeze]
  s.files = [".gitignore".freeze, ".rspec".freeze, ".rubocop.yml".freeze, ".rubocop_todo.yml".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "healthcheck.gemspec".freeze, "lib/healthcheck.rb".freeze, "lib/healthcheck/middleware.rb".freeze, "lib/healthcheck/railtie.rb".freeze, "lib/healthcheck/version.rb".freeze]
  s.homepage = "https://github.com/Alliants/healthcheck".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Simple healthcheck Rack middleware; supports Rails OOTB".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.34.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.34.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.34.0"])
  end
end
