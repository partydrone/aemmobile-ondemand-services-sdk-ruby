require 'ondemand_services/configurable'

module OndemandServices

  # Client for the AEM Mobile Content Producer Service API
  #
  # @see http://wavetronix.github.io/adobe-dps-sdk-ruby/api-docs
  class Client
    include OndemandServices::Configurable

    def initialize(options = {})
      OndemandServices::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || OndemandServices.instance_variable_get(:"@#{key}"))
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
