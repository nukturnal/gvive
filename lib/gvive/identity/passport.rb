module GVIVE
  module Identity
    class Passport < GVIVE::Identities
      attr_accessor :passport_id

      # Passport ID number required
      # @param [String] passport_id
      def initialize(passport_id)
        @passport_id = passport_id
      end

      # Implementing valid? method signature as described in Identity Class
      def valid?
        @response = gvive_request(passport_endpoint, { pid: @passport_id })
        @data = @response.to_o
        @response.success?
      end
    end
  end
end
