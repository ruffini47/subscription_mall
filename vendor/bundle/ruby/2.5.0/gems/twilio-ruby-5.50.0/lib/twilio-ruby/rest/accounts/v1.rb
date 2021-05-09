##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Accounts
      class V1 < Version
        ##
        # Initialize the V1 version of Accounts
        def initialize(domain)
          super
          @version = 'v1'
          @auth_token_promotion = nil
          @credentials = nil
          @secondary_auth_token = nil
        end

        ##
        # @return [Twilio::REST::Accounts::V1::AuthTokenPromotionContext]
        def auth_token_promotion
          @auth_token_promotion ||= AuthTokenPromotionContext.new self
        end

        ##
        # @return [Twilio::REST::Accounts::V1::CredentialContext]
        def credentials
          @credentials ||= CredentialList.new self
        end

        ##
        # @return [Twilio::REST::Accounts::V1::SecondaryAuthTokenContext]
        def secondary_auth_token
          @secondary_auth_token ||= SecondaryAuthTokenContext.new self
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Accounts::V1>'
        end
      end
    end
  end
end