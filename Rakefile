require "bundler/gem_tasks"
require 'cane/rake_task'
require 'rspec/core/rake_task'

task default: :ci

task ci: [:spec, :cane, :generative]

Cane::RakeTask.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation --tag ~generative'
end

RSpec::Core::RakeTask.new(:generative) do |t|
  ENV['GENERATIVE_COUNT'] = '10_000'
  t.rspec_opts = '--format Generative --tag generative'
end
