require "spec_helper"
require "analogbridge/configuration"

RSpec.describe Analogbridge::Configuration do
  describe ".configuration" do
    it "returns the client configuration object" do
      api_host = "https://api.analogbridge.io/v1"
      configuration = Analogbridge.configuration

      expect(configuration.api_host).to eq(api_host)
    end
  end
end
