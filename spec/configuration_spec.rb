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

  describe "#secret_key" do
    it "returns the configured secret key" do
      AnalogBridge.configure do |config|
        config.secret_key = "SECURE_SECRET_KEY"
      end

      expect(AnalogBridge.configuration.secret_key).to eq("SECURE_SECRET_KEY")
    end
  end
end
