ENV['RUBY_ENV'] ||= 'test'

require 'support/klass'

puts RUBY_DESCRIPTION

if RUBY_DESCRIPTION.start_with? "ruby 1.9"
  require 'simplecov'
  SimpleCov.start
end

require 'tp'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

