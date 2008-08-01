Gem::Specification.new do |s|
  s.name = %q{with_named_scope}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Genki Takiuchi"]
  s.date = %q{2008-08-02}
  s.description = %q{Improved named_scope to be used like as with_scope}
  s.email = %q{genki@s21g.com}
  s.extra_rdoc_files = ["README", "ChangeLog"]
  s.files = ["README", "ChangeLog", "Rakefile", "test/test_helper.rb", "test/with_named_scope_test.rb", "test/test.sqlite3", "lib/with_named_scope.rb", "rails/init.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://with_named_scope.rubyforge.org}
  s.rdoc_options = ["--title", "with_named_scope documentation", "--charset", "utf-8", "--opname", "index.html", "--line-numbers", "--main", "README", "--inline-source", "--exclude", "^(examples|extras)/"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{with_named_scope}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Improved named_scope to be used like as with_scope}
  s.test_files = ["test/with_named_scope_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.1.0"])
      s.add_runtime_dependency(%q<redgreen>, [">= 1.2.2"])
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 1.2.2"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.1.0"])
      s.add_dependency(%q<redgreen>, [">= 1.2.2"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.2"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.1.0"])
    s.add_dependency(%q<redgreen>, [">= 1.2.2"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.2"])
  end
end
