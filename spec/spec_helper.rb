ENV['ENVIRONMENT'] = 'test'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', './app/app.rb')
require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'pg'
require_relative './setup_test_database'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


RSpec.configure do |config|
  
  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
    truncate_test_database
  end
end
