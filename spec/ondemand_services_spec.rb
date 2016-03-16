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

  describe ".client" do
    it "creates an OndemandServices::Client" do
      OndemandServices.client.must_be_kind_of OndemandServices::Client
    end

    it "caches the client when the same options are passed" do
      OndemandServices.client.must_equal OndemandServices.client
    end

    it "returns a fresh client when options are not the same" do
      client = OndemandServices.client
      OndemandServices.client_secret = '003aaa97-d965-4728-8992-bbd2ae7c7a4a'
      client_two = OndemandServices.client
      client_three = OndemandServices.client

      client.wont_equal client_two
      client_three.must_equal client_two
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
