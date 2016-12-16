module Analogbridge
  class Configuration
    attr_reader :api_base, :api_version

    def initialize
      @api_base = "https://api.analogbridge.io"
      @api_version = "v1"
    end

    def api_host
      [api_base, api_version].join("/")
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
