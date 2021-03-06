# ==============================================================================
# SPEC - SPEC HELPER
# frozen_string_literal: true
# ==============================================================================
# Configure Simple Cov to get coverage and Codecov.
# !! These should be written at the beginning of this file to work. !!
require "simplecov"
require "simplecov-console"
require "codecov"
if ENV["CI"]
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
else
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console,
  ]
end
SimpleCov.start

# Require core files.
require "bundler/setup"
require "string_foundation"
require "support/enhanced_matchers_extension"

# Require components.
require "random_token"

# ------------------------------------------------------------------------------
# RSpec Settings
# ------------------------------------------------------------------------------
RSpec.configure do |config|
  config.include EnhancedMatchersExtension

  # Enable flags like --only-failures and --next-failure .
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
