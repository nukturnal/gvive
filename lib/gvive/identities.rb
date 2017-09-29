module GVIVE
  class Identities
    include GVIVE::Utils

    attr_accessor :data, :response, :id, :photo, :signature

    # Identity classes have 3 common requirements
    # - ID to search
    # - Option to return a Base64Encoded Image of the ID
    # - Option to return a Base64Encoded Signature of the ID
    # Optionally specify whether you want to return a Base64Encoded Photo
    # Optionally specify whether you want to return a Base64Encoded Signature
    # @param [String] id
    # @param [Boolean] photo
    # @param [Boolean] signature
    def initialize(id, photo = false, signature = false)
      @id = id
      @photo = photo
      @signature = signature
    end

    # Automatically merge photo & signature into the request
    # We don't want to repeat this across all subclasses :)
    def id_params(params = {})
      params.merge(incp: @photo, incs: @signature)
    end

    # Implement this method in subclass
    # Validate Identity with GVIVE Web Service
    # Assign OpenStruct Object via @response.to_o call
    # - to @data variable if request was sucessful
    # @return [Boolean]
    def valid?; end
  end
end

require_relative 'identity/driver'
require_relative 'identity/passport'
require_relative 'identity/voter'
