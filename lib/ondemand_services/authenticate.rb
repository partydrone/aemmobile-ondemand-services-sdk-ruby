require 'httparty'

module Authenticate

  class << self

    def authenticate(client_id, client_secret, device_id, device_token)
      base_url = OndemandServices::Default::AUTHENTICATION_SERVICE_ENDPOINT + '/ims/token/v1'
      params = {
        grant_type: 'device',
        client_id: client_id,
        client_secret: client_secret,
        scope: 'AdobeID,openid',
        device_id: device_id,
        device_token: device_token
      }
      response = HTTParty.post(base_url, query: params)
      response['access_token']
    end
  end
end
