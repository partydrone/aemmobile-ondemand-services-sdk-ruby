$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ondemand_services'

require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'
require 'vcr'
require 'coveralls'

Coveralls.wear!

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :once }
end
