module GVIVE
  module Identity
    class Voter < GVIVE::Identities

      # Voter ID number required
      # Optionally specify whether you want to return a Base64Encoded Photo
      # @param [String] voter_id
      # @param [Boolean] photo
      def initialize(voter_id, photo = false)
        super(voter_id, photo)
      end

      # Implementing valid? method signature as described in Identity Class
      def valid?
        params = id_params({ vid: @id })
        
        # Voter ID does not include signature photo request
        # Let's remove this from the API request call
        params.delete(:incs)

        @response = gvive_request(voter_endpoint, params)
        @data = @response.to_o
        @response.success?
      end
    end
  end
end
