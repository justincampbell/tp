ENV['RUBY_ENV'] ||= 'test'

require 'support/klass'

puts RUBY_DESCRIPTION

unless ENV['skip_coverage']
  require 'simplecov'
  SimpleCov.start
end

require 'tp'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random unless Generative.running?
end
