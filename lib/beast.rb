# frozen_string_literal: true

require_relative "beast/version"
require 'capybara/dsl'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'pry'
require 'yaml'

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :selenium_chrome

module Beast
  class Error < StandardError; end
  
  class Runner
    include RSpec::Matchers
    include Capybara::DSL
  end

  def self.run(&block)
    Runner.new.instance_eval(&block)
  end
end