require "bundler/setup"
require 'simplecov'
SimpleCov.start
require "gvive"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    GVIVE.configure do |config|
      config.api_key = ENV['GVIVE_API_KEY']
      config.username = ENV['GVIVE_USERNAME']
    end

    # Using Environment Variables to hide valid API Keys whiles testing
    @valid_voter_id = ENV['GVIVE_VALID_VID']
    @invalid_voter_id = "6714048442"

    @valid_passport_id = ENV['GVIVE_VALID_PID']
    @invalid_passport_id = "G1071P245"

    @valid_diver_coc = ENV['GVIVE_VALID_DCOC']
    @valid_diver_fullname = ENV['GVIVE_VALID_DNAME']
    @invalid_diver_coc = "GOO625PA"
    @invalid_diver_fullname = "Alfred Robert Rowe"

    @valid_voter = GVIVE::Identity::Voter.new(@valid_voter_id)
    @invalid_voter = GVIVE::Identity::Voter.new(@invalid_voter_id)

    @valid_passport = GVIVE::Identity::Passport.new(@valid_passport_id)
    @invalid_passport = GVIVE::Identity::Passport.new(@invalid_passport_id)

    @valid_driver = GVIVE::Identity::Driver.new(@valid_diver_coc, @valid_diver_fullname)
    @invalid_driver = GVIVE::Identity::Driver.new(@invalid_diver_coc, @invalid_diver_fullname)

  end
end
