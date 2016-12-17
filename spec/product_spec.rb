require "spec_helper"

RSpec.describe AnalogBridge::Product do
  describe ".all" do
    it "lists all existing product" do
      stub_analogbridge_product_listing
      products = AnalogBridge::Product.all

      expect(products.count).to eq(2)
      expect(products.first.name).to eq("35mm Slides")
    end
  end
end
