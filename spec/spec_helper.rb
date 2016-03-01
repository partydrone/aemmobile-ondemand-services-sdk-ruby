require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'content_producer_service'

require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'
require 'vcr'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :once }
end
