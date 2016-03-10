require 'ondemand_services/configurable'
require 'ondemand_services/authenticate'
require 'ondemand_services/authorization'

module OndemandServices

  # Client for the AEM Mobile Content Producer Service API
  #
  # @see http://wavetronix.github.io/adobe-dps-sdk-ruby/api-docs
  class Client

    include OndemandServices::Configurable
    include OndemandServices::Client::Authorization

    attr_accessor :access_token, :client_id

    def initialize(options = {})
      OndemandServices::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || OndemandServices.instance_variable_get(:"@#{key}"))
      end
      @access_token = Authenticate.authenticate(@client_id, @client_secret, @device_id, @device_token)
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
