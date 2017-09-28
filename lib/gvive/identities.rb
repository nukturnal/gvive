module GVIVE
  class Identities
    include GVIVE::Utils

    attr_accessor :data, :response

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
