require "bundler/gem_tasks"
require 'cane/rake_task'
require 'rspec/core/rake_task'

task default: :ci

task :ci do
  Rake::Task[:spec].invoke
  Rake::Task[:cane].invoke
end

Cane::RakeTask.new
RSpec::Core::RakeTask.new
