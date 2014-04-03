ENV['RUBY_ENV'] ||= 'test'

require 'support/klass'

puts RUBY_DESCRIPTION

require 'simplecov'
SimpleCov.start

require 'tp'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random

  config.before do
    Screen.stub clear!: nil, print: nil
  end
end
