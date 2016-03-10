require 'httparty'

module OndemandServices
  class Client
    module Authorization

      def authorize
        base_url = OndemandServices::Default::AUTHORIZATION_SERVICE_ENDPOINT + '/permissions'
        headers = {
          'x-dps-api-key' => client_id,
          'x-dps-client-version' => '0.1.0',
          'x-dps-client-request-id' => 'a985b15e-4385-01e5-335f-c573e246b44a', # Needs to be configuarable
          'x-dps-client-session-id' => 'df584325-3825-ade4-ff32-a486c25e4456', # Needs to be configuarable
          'c-dps-client-id' => client_id,
          'authorization' => access_token
        }
        response = HTTParty.get(base_url, headers: headers)
      end
    end
  end
end
