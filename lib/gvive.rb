require "gvive/version"
require "gvive/configuration"
require "gvive/encoding"
require "gvive/response"
require "gvive/utils"
require "gvive/identities"

module GVIVE
  class << self
  attr_accessor :configuration
end

def self.configuration
  @configuration ||= Configuration.new
end

def self.reset
  @configuration = Configuration.new
end

def self.configure
  yield(configuration)
end
end
