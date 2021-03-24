# -*- encoding: utf-8 -*-
# stub: business_time 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "business_time".freeze
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["bokmann".freeze]
  s.date = "2021-02-24"
  s.description = "Have you ever wanted to do things like \"6.business_days.from_now\" and have weekends and holidays taken into account?  Now you can.".freeze
  s.email = "dbock@javaguy.org".freeze
  s.homepage = "https://github.com/bokmann/business_time".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Support for doing time math in business hours and days".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.2.0"])
    s.add_runtime_dependency(%q<tzinfo>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sorted_set>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest-rg>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<tzinfo>.freeze, [">= 0"])
    s.add_dependency(%q<sorted_set>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<minitest-rg>.freeze, [">= 0"])
  end
end
