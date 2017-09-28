module GVIVE
  module Identity
    class Voter < GVIVE::Identities
      attr_accessor :voter_id

      # Voter ID number required
      # @param [String] voter_id
      def initialize(voter_id)
        @voter_id = voter_id
      end

      # Implementing valid? method signature as described in Identity Class
      def valid?
        @response = gvive_request(voter_endpoint, { vid: @voter_id })
        @data = @response.to_o
        @response.success?
      end
    end
  end
end
