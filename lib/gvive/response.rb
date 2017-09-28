require 'json'
require 'ostruct'

module GVIVE
  class Response
    attr_accessor :http_response, :cache

    # Requires an HTTP::Response Object
    # which is a dependency from the http gem Response Class
    # @param [HTTP::Response] http_response
    def initialize(http_response)
      @http_response = http_response
    end

    # Convert response data to plain Ruby Objects
    # @return [OpenStruct]
    def to_o
      @cache = JSON.parse @http_response.body.to_s, object_class: OpenStruct
    end

    # GVIVE returned valid response
    # Check the raw HTTP Response for success
    # Check also for GVIVE ResponseCode Key in the response body 200 for data found
    # @return [Boolean]
    def success?
      @http_response.code == 200 && to_o.ResponseCode == "200"
    end
  end
end
