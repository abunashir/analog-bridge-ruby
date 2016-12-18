require "spec_helper"

RSpec.describe AnalogBridge::Product do
  describe ".list" do
    it "lists all existing product" do
      stub_analogbridge_product_listing
      products = AnalogBridge::Product.list

      expect(products.count).to eq(2)
      expect(products.first.name).to eq("35mm Slides")
    end
  end
end
