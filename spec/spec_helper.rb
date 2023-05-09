# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
