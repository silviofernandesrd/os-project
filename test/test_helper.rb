require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

# require "minitest/autorun"
# TODO: Rails 5 + minitest bug, roda 2x - quando arrumar remover linhas abaixo e voltar o autorun
require "minitest"
require "minitest/spec"
require "minitest/mock"
require "minitest/hell" if ENV["MT_HELL"]

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...

  # Add more helper methods to be used by all tests here...
  extend MiniTest::Spec::DSL

  # Include helpers
  # include ModelTestHelpers
end

# Shoulda::Matchers.configure do |config|
#   config.integrate do |with|
#     with.test_framework :minitest
#     with.library :rails
#   end
# end
