require 'spec_helper'

describe OndemandServices do
  before do
    OndemandServices.reset!
  end

  after do
    OndemandServices.reset!
  end

  it "sets defaults" do
    OndemandServices::Configurable.keys.each do |key|
      OndemandServices.instance_variable_get(:"@#{key}").must_equal OndemandServices::Default.send(key)
    end
  end

  describe ".configure" do
    OndemandServices::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        OndemandServices.configure do |config|
          config.send("#{key}=", key)
        end
        OndemandServices.instance_variable_get(:"@#{key}").must_equal key
      end
    end
  end
end
