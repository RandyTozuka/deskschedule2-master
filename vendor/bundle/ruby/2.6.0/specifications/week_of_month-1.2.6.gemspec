# -*- encoding: utf-8 -*-
# stub: week_of_month 1.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "week_of_month".freeze
  s.version = "1.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sachin87".freeze, "Tommyixi".freeze, "Matt--".freeze, "berikin".freeze, "pablorusso".freeze, "AstonJ".freeze, "swapnilchincholkar".freeze, "hitendrasingh".freeze, "ilake".freeze, "fursich".freeze]
  s.date = "2019-03-29"
  s.description = "Its gives you week_of_month method on date and time objects, that returns week of the month.".freeze
  s.email = ["sachin.y87@gmail.com".freeze]
  s.homepage = "https://github.com/sachin87/week-of-month".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Week of month!".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 12.0.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.15.4"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 3.2.5"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 12.0.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.15.4"])
    s.add_dependency(%q<test-unit>.freeze, [">= 3.2.5"])
  end
end
