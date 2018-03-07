require 'simplecov'
SimpleCov.start

require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/front_desk'
require_relative '../lib/room'
require_relative '../lib/reservation'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
