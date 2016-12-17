require "spec_helper"

RSpec.describe AnalogBridge::Customer do
  describe ".create" do
    it "creates a new customer" do
      stub_analogbridge_customer_create(customer_attributes)
      customer = AnalogBridge::Customer.create(customer_attributes)

      expect(customer.cus_id).not_to be_nil
      expect(customer.metadata.user_id).to eq(123456)
      expect(customer.email).to eq("demo@analogbridge.io")
    end
  end

  def customer_attributes
    {
      email: "demo@analogbridge.io",
      shipping: {
        first_name: "John",
        last_name: "Smith",
        address1: "3336 Commercial Ave",
        city: "Northbrook",
        state: "IL",
        zip: "60062",
        phone: "800-557-3508",
        email: "demo@analogbridge.io",
      },
      metadata: {
        user_id: "123456",
      },
    }
  end
end
