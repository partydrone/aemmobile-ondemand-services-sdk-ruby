$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ondemand_services'

require 'minitest/autorun'
require 'minitest/reporters'
require 'coveralls'

Coveralls.wear!

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
