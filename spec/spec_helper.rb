require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
