# frozen_string_literal: true

require 'simplecov'

require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov::Formatter::Console.show_covered = true
SimpleCov::Formatter::Console.max_rows = -1
SimpleCov::Formatter::Console.output_style = 'block'
SimpleCov.start do
  enable_coverage :branch
end

require 'bc'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
