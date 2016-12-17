require "spec_helper"

RSpec.describe AnalogBridge::Order do
  describe ".where" do
    context "only customer_id provided" do
      it "retrieves all orders for that customer" do
        customer_id = "cus_28b70539d2b10be293bdeb3c"
        stub_analogbridge_order_listing(customer_id: customer_id)
        orders = AnalogBridge::Order.where(customer_id: customer_id)

        expect(orders.first.items.count).to eq(2)
        expect(orders.first.cus_id).to eq(customer_id)
        expect(orders.first.items.first.id).not_to be_nil
      end
    end
  end
end
