require 'spec_helper'

module ContentProducerService
  describe Client do
    before do
      ContentProducerService.reset!
    end

    after do
      ContentProducerService.reset!
    end

    describe "module configuration" do
      before do
        ContentProducerService.reset!
        ContentProducerService.configure do |config|
          ContentProducerService::Configurable.keys.each do |key|
            config.send("#{key}=", "Some #{key}")
          end
        end
      end

      after do
        ContentProducerService.reset!
      end

      it "inherits the module configuration" do
        client = ContentProducerService::Client.new
        ContentProducerService::Configurable.keys.each do |key|
          client.instance_variable_get(:"@#{key}").must_equal "Some #{key}"
        end
      end

      describe "with class level configuration" do
        before do
          @opts = {
            client_id: 'My client_id',
            client_secret: 'My client_secret',
            device_id: 'My device_id',
            device_token: 'My device_token'
          }
        end

        it "overrides module configuration" do
          client = ContentProducerService::Client.new(@opts)
          client.client_id.must_equal 'My client_id'
          client.client_secret.must_equal 'My client_secret'
          client.device_id.must_equal 'My device_id'
          client.device_token.must_equal 'My device_token'
        end

        it "can set configuration after initialization" do
          client = ContentProducerService::Client.new
          client.configure do |config|
            @opts.each do |key, value|
              config.send("#{key}=", value)
            end
          end
          client.client_id.must_equal 'My client_id'
          client.client_secret.must_equal 'My client_secret'
          client.device_id.must_equal 'My device_id'
          client.device_token.must_equal 'My device_token'
        end

        it "masks secrets on inspect" do
          client = ContentProducerService::Client.new(client_secret: '1234567890abcdef')
          inspected = client.inspect
          inspected.wont_include '1234567890abcdef'
        end

        it "masks tokens on inspect" do
          client = ContentProducerService::Client.new(device_token: '1234567890abcdef')
          inspected = client.inspect
          inspected.wont_include '1234567890abcdef'
        end
      end
    end
  end
end
