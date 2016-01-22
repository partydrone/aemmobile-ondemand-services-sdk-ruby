require 'spec_helper'

module Adobe
  module DPS
    describe Authentication do
      let(:authenticator) { Authentication.new }

      it "exists" do
        authenticator.must_be_kind_of Authentication
      end

      it "has a grant_type setter method" do
        authenticator.grant_type = 'device'
        authenticator.grant_type.must_equal 'device'
      end

      it "has a client_id setter method" do
        authenticator.client_id = 'dps-test-client'
        authenticator.client_id.must_equal 'dps-test-client'
      end

      it "has a client_secret setter method" do
        authenticator.client_secret = 'device'
        authenticator.client_secret.must_equal 'device'
      end

      it "has a scope setter method" do
        authenticator.scope = 'AdobeID,openid'
        authenticator.scope.must_equal 'AdobeID,openid'
      end

      it "has a device_id setter method" do
        authenticator.device_id = 'device'
        authenticator.device_id.must_equal 'device'
      end

      it "has a device_token setter method" do
        authenticator.device_token = 'device'
        authenticator.device_token.must_equal 'device'
      end

      describe "with invalid request" do

      end
    end
  end
end
