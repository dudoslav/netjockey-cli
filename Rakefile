require 'bundler/gem_tasks'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

desc 'Run acceptance tests (RSpec + Rubocop)'
task test: 'acceptance'

desc 'Run acceptance tests (RSpec + Rubocop)'
task :acceptance do |_t|
  Rake::Task['rubocop'].invoke
end

