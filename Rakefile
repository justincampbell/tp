require "bundler/gem_tasks"
require 'cane/rake_task'
require 'rspec/core/rake_task'

task default: :ci

task ci: [:spec, :cane]

Cane::RakeTask.new do |cane|
  cane.canefile = '.cane'
  cane.add_threshold 'coverage/.last_run.json', :>=, 100
end

RSpec::Core::RakeTask.new
