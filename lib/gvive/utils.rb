require 'http'

module GVIVE
  module Utils
    include GVIVE::Encoding

    attr_accessor :status, :response_text, :transaction_id,
                  :uuid, :result, :response, :amount

    # Voter ID Verification Endpoint
    def voter_endpoint
      endpoint GVIVE.configuration.voter_path
    end

    # Passport Verification Endpoint
    def passport_endpoint
      endpoint GVIVE.configuration.passport_path
    end

    # Driver's License Verification Endpoint
    def driver_endpoint
      endpoint GVIVE.configuration.driver_path
    end

    # GVIVE HTTP Request
    def gvive_request(url, params = {})
      result = http_connect(url, params)
      GVIVE::Response.new(result)
    end

    # Append base_url to all paths
    def endpoint(path = nil)
      "#{GVIVE.configuration.base_url}#{path}"
    end

    # HTTP Connection with Digest as required by GVIVE
    def http_connect(url, params = {})
      request_concat_str = request_concat(url, params)
      hmac_digest_str = hmac_digest(GVIVE.configuration.api_key, request_concat_str)
      auth_token_str = auth_token(GVIVE.configuration.username, hmac_digest_str)
      HTTP.auth("hmac #{auth_token_str}").get(url, params: params)
    end
  end
end
