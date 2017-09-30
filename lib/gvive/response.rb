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
      old_hash = JSON.parse @http_response.body.to_s
      new_hash = {}
      old_hash.each do |k,v|
        new_hash["#{snakecase(k)}"] = v
      end
      @cache = OpenStruct.new(new_hash)
    end

    # Shamelessly copied from the internet with 1% modifications :)
    # http://www.rubydoc.info/github/rubyworks/facets/String%3Asnakecase
    # Convert all CamelCased strings to snake_cased
    # @param [String] str
    # @return [String]
    def snakecase(str)
      str.to_s.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr('-', '_').
      gsub(/\s/, '_').
      gsub(/__+/, '_').
      downcase
    end

    # GVIVE returned valid response
    # Check the raw HTTP Response for success
    # Check also for GVIVE ResponseCode Key in the response body 200 for data found
    # @return [Boolean]
    def success?
      @http_response.code == 200 && to_o.response_code == "200"
    end
  end
end
