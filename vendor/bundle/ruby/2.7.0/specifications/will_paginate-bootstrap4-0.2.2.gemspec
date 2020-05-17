# -*- encoding: utf-8 -*-
# stub: will_paginate-bootstrap4 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "will_paginate-bootstrap4".freeze
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ivan Palamarchuk".freeze]
  s.date = "2018-01-10"
  s.description = "Hooks into will_paginate to format the html to match Twitter Bootstrap 4 styling.".freeze
  s.email = "i.delef@gmail.com".freeze
  s.homepage = "https://github.com/delef/will_paginate-bootstrap4".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "3.1.3".freeze
  s.summary = "Format will_paginate html to match Twitter Bootstrap 4 styling.".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<will_paginate>.freeze, ["~> 3.0", ">= 3.0.0"])
  else
    s.add_dependency(%q<will_paginate>.freeze, ["~> 3.0", ">= 3.0.0"])
  end
end
