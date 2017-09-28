module GVIVE
  class Configuration
    attr_accessor :base_url, :api_key, :username, :voter_path, :passport_path, :driver_path

    def initialize
      @base_url       = 'https://gvivegh.com:1355/gvivewar' # GVIVE Base Endpoint
      @api_key        = ENV['GVIVE_API_KEY'] # GVIVE APIKey
      @username       = ENV['GVIVE_USERNAME'] # GVIVE Username
      @voter_path     = '/voter' # Voter ID Veriification path
      @passport_path  = '/passport' # Passport Veriification path
      @driver_path    = '/driver' # Driver License Veriification path
    end
  end
end
