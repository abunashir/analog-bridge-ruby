module AnalogBridge
  class Configuration
    attr_accessor :api_base, :api_version, :secret_key

    def initialize
      @api_base ||= "https://api.analogbridge.io"
      @api_version ||= "v1"
    end

    def api_host
      [api_base, api_version].join("/")
    end
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
