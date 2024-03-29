# -*- encoding: utf-8 -*-
# stub: b2-client 1.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "b2-client".freeze
  s.version = "1.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jon Bracy".freeze]
  s.date = "2020-07-27"
  s.description = "Backblaze B2 Client".freeze
  s.email = ["jonbracy@gmail.com".freeze]
  s.homepage = "https://github.com/malomalo/b2".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "Backblaze B2 Client".freeze

  s.installed_by_version = "3.0.3.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
