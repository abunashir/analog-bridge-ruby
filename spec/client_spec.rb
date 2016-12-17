require "spec_helper"

RSpec.describe AnalogBridge::Client do
  describe ".get_resource" do
    it "loads the resource via :get" do
      stub_get_resource_request("ping")
      resource = AnalogBridge.get_resource("ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  def stub_get_resource_request(end_point)
    stub_request(
      :get, [AnalogBridge.configuration.api_host, end_point].join("/")
    ).and_return(status: 200, body: JSON.generate(data: "Pong!"))
  end
end
