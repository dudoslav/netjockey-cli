Gem::Specification.new do |s|
  s.name = 'netjockey'
  s.version = '0.0.0'
  s.date = '2016-11-11'
  s.summary = 'Netjockey cli'
  s.description = 'Netjockey cli for fetching data from server'
  s.authors = ['Dusan Baran']
  s.email = 'dbaran@hotmail.sk'
  s.license = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.13'
  s.add_development_dependency 'rake', '~> 11.2'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'rubocop', '~> 0.42'
  s.add_development_dependency 'webmock'

  s.add_runtime_dependency 'thor', '~> 0.19'
end
