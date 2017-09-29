require 'cgi'

module GVIVE
  module Identity
    class Driver < GVIVE::Identities
      attr_accessor :fullname

      # Certificate of Competence required
      # Fullname of card holder as it appears on the card
      # Optionally specify whether you want to return a Base64Encoded Photo
      # Optionally specify whether you want to return a Base64Encoded signature
      # @param [String] coc
      # @param [String] fullname
      # @param [Boolean] photo
      # @param [Boolean] signature
      def initialize(coc, fullname, photo = false, signature = false)
        super(coc, photo, signature)
        @fullname = fullname
      end

      # Implementing valid? method signature as described in Identity Class
      def valid?
        @response = gvive_request(driver_endpoint, id_params({ coc: @id, fname: @fullname}))
        @data = @response.to_o
        @response.success?
      end
    end
  end
end
