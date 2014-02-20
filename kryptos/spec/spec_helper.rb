# encoding: UTF-8

# Author:: Eric Weinstein

ENV['RACK_ENV'] = 'test'

require 'rspec'
require_relative '../lib/dekryptos'

RSpec.configure do |c|
  # Randomize specs to surface order dependencies
  c.order = 'random'
end
