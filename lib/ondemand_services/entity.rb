require 'json'
require 'httparty'
require 'ostruct'
require 'securerandom'


module OndemandServices
  class Client
    module Entity

      def all(publication_id)
        base_url = OndemandServices::Default::PRODUCER_SERVICE_ENDPOINT + '/publication/' + publication_id
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

      def find(publication_id, entity_type)
        base_url = OndemandServices::Default::PRODUCER_SERVICE_ENDPOINT + '/publication/' + publication_id
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
