require 'spec_helper'

describe ContentProducerService do
  before do
    ContentProducerService.reset!
  end

  after do
    ContentProducerService.reset!
  end

  it "sets defaults" do
    ContentProducerService::Configurable.keys.each do |key|
      ContentProducerService.instance_variable_get(:"@#{key}").must_equal ContentProducerService::Default.send(key)
    end
  end

  describe ".configure" do
    ContentProducerService::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        ContentProducerService.configure do |config|
          config.send("#{key}=", key)
        end
        ContentProducerService.instance_variable_get(:"@#{key}").must_equal key
      end
    end
  end
end
