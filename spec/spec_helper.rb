require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'

$:.unshift File.expand_path("../lib", __FILE__)

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

