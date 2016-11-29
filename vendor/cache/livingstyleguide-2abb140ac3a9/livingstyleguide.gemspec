# -*- encoding: utf-8 -*-
# stub: livingstyleguide 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "livingstyleguide".freeze
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nico Hagenburger".freeze]
  s.date = "2016-11-29"
  s.description = "Automatically generate beautiful front-end style guides with Sass and Markdown. See https://livingstyleguide.org for details.".freeze
  s.email = ["nico@hagenburger.net".freeze]
  s.executables = ["livingstyleguide".freeze]
  s.files = ["bin/livingstyleguide".freeze, "lib/livingstyleguide.rb".freeze, "lib/livingstyleguide/command_line_interface.rb".freeze, "lib/livingstyleguide/commands.rb".freeze, "lib/livingstyleguide/commands/add_wrapper_class.rb".freeze, "lib/livingstyleguide/commands/coffee_script.rb".freeze, "lib/livingstyleguide/commands/colors.rb".freeze, "lib/livingstyleguide/commands/css.rb".freeze, "lib/livingstyleguide/commands/data.rb".freeze, "lib/livingstyleguide/commands/default.rb".freeze, "lib/livingstyleguide/commands/font_example.rb".freeze, "lib/livingstyleguide/commands/full_width.rb".freeze, "lib/livingstyleguide/commands/haml.rb".freeze, "lib/livingstyleguide/commands/import_and_use.rb".freeze, "lib/livingstyleguide/commands/javascript.rb".freeze, "lib/livingstyleguide/commands/layout.rb".freeze, "lib/livingstyleguide/commands/markdown.rb".freeze, "lib/livingstyleguide/commands/options.rb".freeze, "lib/livingstyleguide/commands/require.rb".freeze, "lib/livingstyleguide/commands/sass.rb".freeze, "lib/livingstyleguide/commands/search_box.rb".freeze, "lib/livingstyleguide/commands/style.rb".freeze, "lib/livingstyleguide/commands/syntax.rb".freeze, "lib/livingstyleguide/commands/toggle_code.rb".freeze, "lib/livingstyleguide/commands/type.rb".freeze, "lib/livingstyleguide/document.rb".freeze, "lib/livingstyleguide/integration.rb".freeze, "lib/livingstyleguide/integration/compass.rb".freeze, "lib/livingstyleguide/integration/rails.rb".freeze, "lib/livingstyleguide/integration/sass.rb".freeze, "lib/livingstyleguide/integration/sprockets.rb".freeze, "lib/livingstyleguide/markdown_extensions.rb".freeze, "lib/livingstyleguide/templates/code.html.erb".freeze, "lib/livingstyleguide/templates/default.html.erb".freeze, "lib/livingstyleguide/templates/example.html.erb".freeze, "lib/livingstyleguide/templates/font-example.html.erb".freeze, "lib/livingstyleguide/templates/javascript.html.erb".freeze, "lib/livingstyleguide/templates/layout.html.erb".freeze, "lib/livingstyleguide/templates/logo.html.erb".freeze, "lib/livingstyleguide/templates/plain.html.erb".freeze, "lib/livingstyleguide/templates/scripts/copy.js.erb".freeze, "lib/livingstyleguide/templates/scripts/copy_code.js.erb".freeze, "lib/livingstyleguide/templates/scripts/copy_colors.js.erb".freeze, "lib/livingstyleguide/templates/scripts/search.js.erb".freeze, "lib/livingstyleguide/templates/scripts/toggle_code.js.erb".freeze, "lib/livingstyleguide/templates/search-box.html.erb".freeze, "lib/livingstyleguide/templates/toggle-code.html.erb".freeze, "lib/livingstyleguide/tilt_template.rb".freeze, "lib/livingstyleguide/version.rb".freeze, "stylesheets/_livingstyleguide.scss".freeze, "stylesheets/livingstyleguide/_before.scss".freeze, "stylesheets/livingstyleguide/_code.scss".freeze, "stylesheets/livingstyleguide/_color-swatches.scss".freeze, "stylesheets/livingstyleguide/_content.scss".freeze, "stylesheets/livingstyleguide/_functions.scss".freeze, "stylesheets/livingstyleguide/_layout.scss".freeze, "stylesheets/livingstyleguide/_reset.scss".freeze, "stylesheets/livingstyleguide/_search-box.scss".freeze, "stylesheets/livingstyleguide/_toggle-code.scss".freeze]
  s.homepage = "https://livingstyleguide.org".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Generate beautiful front-end style guides".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minisyntax>.freeze, [">= 0.2.5"])
      s.add_runtime_dependency(%q<sass>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<redcarpet>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<tilt>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
      s.add_development_dependency(%q<compass>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<haml>.freeze, [">= 0"])
      s.add_development_dependency(%q<erubis>.freeze, [">= 0"])
      s.add_development_dependency(%q<heredoc_unindent>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<coffee-script>.freeze, [">= 0"])
      s.add_development_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_development_dependency(%q<scss-lint>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    else
      s.add_dependency(%q<minisyntax>.freeze, [">= 0.2.5"])
      s.add_dependency(%q<sass>.freeze, [">= 0"])
      s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
      s.add_dependency(%q<tilt>.freeze, [">= 0"])
      s.add_dependency(%q<thor>.freeze, [">= 0"])
      s.add_dependency(%q<compass>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<haml>.freeze, [">= 0"])
      s.add_dependency(%q<erubis>.freeze, [">= 0"])
      s.add_dependency(%q<heredoc_unindent>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<coffee-script>.freeze, [">= 0"])
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_dependency(%q<scss-lint>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<minisyntax>.freeze, [">= 0.2.5"])
    s.add_dependency(%q<sass>.freeze, [">= 0"])
    s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
    s.add_dependency(%q<tilt>.freeze, [">= 0"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<compass>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<haml>.freeze, [">= 0"])
    s.add_dependency(%q<erubis>.freeze, [">= 0"])
    s.add_dependency(%q<heredoc_unindent>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<coffee-script>.freeze, [">= 0"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<scss-lint>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
  end
end
