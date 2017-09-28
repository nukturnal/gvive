require 'uri'
require 'cgi'
require 'openssl'
require 'base64'

# GVIVE Payload Diget
module GVIVE
  module Encoding

    # From the GVIVE docs this is REQUEST METHOD + ENCODED URL
    # eg. https://gvivegh.com:1355/gvivewar/Voter?Vid=123456
    # becomes https%3A%2F%2Fgvivegh.com%3A1355%2Fgvivewar%2FVoter%3FVid%3D123456
    # The url encoding must be converted to lowercase
    # @param [String] url
    # @param [Hash] params
    # @param [String] method
    def request_concat(url, params={}, method="GET")
      url_build = CGI.escape("#{url}?#{URI.encode_www_form(params)}").downcase
      "#{method.upcase}#{url_build}"
    end

    # GVIVE docs states the digest signature as DIGEST = HMAC-SHA256(REQCONCAT, API KEY)
    # The digest result should also be encodeded in Base64 format
    # @param [String] api_key
    # @param [String] request_concat
    # @return [Base64]
    def hmac_digest(api_key, request_concat)
      Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', api_key, request_concat))
    end

    # Base64 encoding of USERNAME:HMAC-DIGEST
    # @param [String] username
    # @param [String] hmac_digest
    # @return [Base64]
    def auth_token(username, hmac_digest)
      Base64.strict_encode64("#{username}:#{hmac_digest}")
    end

  end
end
