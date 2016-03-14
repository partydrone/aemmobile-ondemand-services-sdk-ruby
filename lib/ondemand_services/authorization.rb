require 'json'
require 'httparty'
require 'ostruct'
require 'securerandom'

module OndemandServices
  class Client
    module Authorization

      def authorize
        base_url = OndemandServices::Default::AUTHORIZATION_SERVICE_ENDPOINT + '/permissions'
        headers = {
          'x-dps-api-key' => client_id,
          'x-dps-client-version' => OndemandServices::VERSION,
          'x-dps-client-request-id' => SecureRandom.uuid,
          'x-dps-client-session-id' => session_id,
          'c-dps-client-id' => client_id,
          'authorization' => access_token
        }
        response = HTTParty.get(base_url, headers: headers)
        JSON.parse(response.to_json, object_class: OpenStruct)
      end
    end
  end
end
