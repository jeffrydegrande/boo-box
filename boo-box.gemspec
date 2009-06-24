# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{boo-box}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeffry Degrande"]
  s.date = %q{2009-06-23}
  s.description = %q{Tiny ruby wrapper on the boo-box API}
  s.email = %q{jeffry@jeffrydegrande.com}
  s.files = [
    ".gitignore",
     "Rakefile",
     "VERSION",
     "lib/boo-box.rb",
     "lib/boo-box/base.rb",
     "lib/boo-box/product.rb",
     "test/helper.rb",
     "test/test.json",
     "test/test_boobox.rb",
     "test/test_product.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http;//github.com/jeffrydegrande/boo-box}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby wrapper on the boo-box API}
  s.test_files = [
    "test/test_boobox.rb",
     "test/helper.rb",
     "test/test_product.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
