require "spec_helper"

RSpec.describe AnalogBridge::Client do
  describe ".get_resource" do
    it "loads the resource via :get" do
      stub_get_resource_request("ping")
      resource = AnalogBridge.get_resource("ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  describe ".post_resource" do
    it "submit the request via :post" do
      stub_post_ping_request
      resource = AnalogBridge.post_resource("ping", {})

      expect(resource.data).to eq("Pong!")
    end
  end

  describe ".delete_resource" do
    it "submits the request via :delete" do
      stub_delete_ping_request
      resource = AnalogBridge.delete_resource("ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  def stub_get_resource_request(end_point)
    stub_request(
      :get, [AnalogBridge.configuration.api_host, end_point].join("/")
    ).and_return(status: 200, body: JSON.generate(data: "Pong!"))
  end

  def stub_post_ping_request
    stub_request(:post, "https://api.analogbridge.io/v1/ping").
      to_return(status: 200, body: JSON.generate(data: "Pong!"))
  end

  def stub_delete_ping_request
    stub_request(:delete, "https://api.analogbridge.io/v1/ping").
      to_return(status: 200, body: JSON.generate(data: "Pong!"))
  end
end
