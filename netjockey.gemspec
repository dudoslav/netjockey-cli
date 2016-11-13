Gem::Specification.new do |s|
  s.name = 'netjockey'
  s.version = '0.0.0'
  s.date = '2016-11-11'
  s.summary = 'Netjockey cli'
  s.description = 'Netjockey cli for fetching data from server'
  s.authors = ['Dusan Baran']
  s.email = 'dbaran@hotmail.sk'

  s.add_development_dependency 'bundler', '~> 1.13'
  s.add_development_dependency 'rake', '~> 11.2'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'rubocop', '~> 0.42'

  s.add_runtime_dependency 'thor', '~> 0.19'

  s.files = ['lib/netjockey.rb',
             'lib/netjockey/service.rb',
             'lib/netjockey/cli.rb']
  s.executables = ['netjockey']
  s.license = 'MIT'
end
