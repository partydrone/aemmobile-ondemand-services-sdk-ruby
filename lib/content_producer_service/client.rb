require 'content_producer_service/configurable'

module ContentProducerService

  # Client for the AEM Mobile Content Producer Service API
  #
  # @see http://wavetronix.github.io/adobe-dps-sdk-ruby/api-docs
  class Client
    include ContentProducerService::Configurable

    def initialize(options = {})
      ContentProducerService::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || ContentProducerService.instance_variable_get(:"@#{key}"))
      end

      # TODO: Authenticate here?
    end

    # Text representation of the client, masking secrets and tokens
    #
    # @return [String]
    def inspect
      inspected = super

      inspected = inspected.gsub! @client_secret, '********' if @client_secret
      inspected = inspected.gsub! @device_token, '********' if @device_token

      inspected
    end
  end
end
