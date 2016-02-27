require 'content_producer_service/client'
require 'content_producer_service/default'

# Ruby toolkit for the Adobe Experience Manager Mobile (AEM Mobile) Content
# Producer Service API.
module ContentProducerService
  class << self
    include ContentProducerService::Configurable

    # API client based on the configured options {Configurable}
    #
    # @return [ContentProducerService::Client] API wrapper
    def client
      return @client if defined?(@client) && @client.same_options?(options)
      @client = ContentProducerService::Client.new(options)
    end
  end
end

ContentProducerService.setup
