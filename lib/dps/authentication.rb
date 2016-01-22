require 'net/http'

module Adobe
  module DPS
    class Authentication
      attr_accessor :grant_type, :client_id, :client_secret, :scope, :device_id, :device_token

      def initialize(grant_type = 'device', client_id = ENV['ADOBE_DPS_IMS_CLIENT_ID'], client_secret = ENV['ADOBE_DPS_SECRET_KEY'], scope = 'AdobeID,openid', device_id = ENV['ADOBE_DPS_DEVICE_ID'], device_token = ENV['ADOBE_DPS_DEVICE_TOKEN'])
        @grant_type    = grant_type
        @client_id     = client_id
        @client_secret = client_secret
        @scope         = scope
        @device_id     = device_id
        @device_token  = device_token
      end

      def base_path
        "/ims/token/v1"
      end

      def authenticate
        path = 'https://ims-na1.adobelogin.com'
        path += base_path
        path += "?grant_type=#{@grant_type}"
        path += "&client_id=#{@client_id}"
        path += "&client_secret=#{@client_secret}"
        path += "&scope=#{@scope}"
        path += "&device_id=#{@device_id}"
        path += "&device_token=#{@device_token}"

        uri = URI.parse('https://ims-na1.adobelogin.com')
        http = Net::HTTP.new(uri.host, uri.port)

        request = Net::HTTP::Get.new(path)
        response = http.request(request)

        return response
      end
    end
  end
end
