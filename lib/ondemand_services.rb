require 'ondemand_services/client'
require 'ondemand_services/default'

# Ruby toolkit for the Adobe Experience Manager Mobile (AEM Mobile) Content
# Producer Service API.
module OndemandServices
  class << self
    include OndemandServices::Configurable

    # API client based on the configured options {Configurable}
    #
    # @return [OndemandServices::Client] API wrapper
    def client
      return @client if defined?(@client) && @client.same_options?(options)
      @client = OndemandServices::Client.new(options)
    end
  end
end

OndemandServices.setup
