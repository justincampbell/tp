require "bundler/gem_tasks"
require 'cane/rake_task'
require 'rspec/core/rake_task'
require 'generative/rake_task'

task default: :ci

task ci: [:spec, :cane, :generative]

Cane::RakeTask.new
RSpec::Core::RakeTask.new
Generative::RakeTask.new
