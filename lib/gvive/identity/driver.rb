module GVIVE
  module Identity
    class Driver < GVIVE::Identities
      attr_accessor :coc, :fullname

      # Certificate of Competence required
      # Fullname of card holder as it appears on the card
      # @param [String] coc
      # @param [String] fullname
      def initialize(coc, fullname)
        @coc = coc
        @fullname = fullname
      end

      # Implementing valid? method signature as described in Identity Class
      def valid?
        @response = gvive_request(voter_endpoint, { coc: @coc, fname: @fullname })
        @data = @response.to_o
        @response.success?
      end
    end
  end
end
