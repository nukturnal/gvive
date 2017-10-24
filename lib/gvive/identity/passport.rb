module GVIVE
  module Identity
    class Passport < GVIVE::Identities

      # Passport ID number required
      # Optionally specify whether you want to return a Base64Encoded Photo
      # Optionally specify whether you want to return a Base64Encoded signature
      # @param [String] passport_id
      # @param [Boolean] photo
      # @param [Boolean] signature
      def initialize(passport_id, photo = false, signature = false)
        super(passport_id, photo, signature)
      end

      # Implementing valid? method signature as described in Identity Class
      def valid?
        @response = gvive_request(passport_endpoint, id_params({ pid: @id }))
        @data = @response.to_o
        @response.success?
      end
    end
  end
end
