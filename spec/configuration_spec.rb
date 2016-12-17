require "spec_helper"
require "analogbridge/configuration"

RSpec.describe AnalogBridge::Configuration do
  describe ".configuration" do
    it "returns the client configuration object" do
      api_host = "https://api.analogbridge.io/v1"
      configuration = AnalogBridge.configuration

      expect(configuration.api_host).to eq(api_host)
    end
  end
end
