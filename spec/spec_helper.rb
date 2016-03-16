require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
require 'simplecov-json'
require 'coveralls'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ondemand_services'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
