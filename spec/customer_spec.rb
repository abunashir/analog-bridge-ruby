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

  describe ".find" do
    it "retrieves the specified customer" do
      customer_id = "cus_28b70539d2b10be293bdeb3c"
      stub_analogbridge_customer_find(customer_id)
      customer = AnalogBridge::Customer.find(customer_id)

      expect(customer.cus_id).to eq(customer_id)
      expect(customer.metadata.user_id).to eq(123456)
      expect(customer.email).to eq("demo@analogbridge.io")
    end
  end

  describe ".update" do
    it "updates an existing customer details" do
      customer_id = "cus_28b70539d2b10be293bdeb3c"
      stub_analogbridge_customer_update(customer_id, customer_attributes)
      customer = AnalogBridge::Customer.update(customer_id, customer_attributes)

      expect(customer.cus_id).to eq(customer_id)
      expect(customer.metadata.user_id).to eq(123456)
      expect(customer.email).to eq("demo@analogbridge.io")
    end
  end

  describe ".delete" do
    it "deletes a specified customer" do
      customer_id = "cus_28b70539d2b10be293bdeb3c"
      stub_analogbridge_customer_delete(customer_id)
      customer = AnalogBridge::Customer.delete(customer_id)

      expect(customer.deleted).not_to be_nil
      expect(customer.cus_id).to eq(customer_id)
      expect(customer.deleted).not_to be_nil
    end
  end

  describe ".all" do
    it "retrieve all the customers" do
      filters = { limit: "2", offset: "10" }
      stub_analogbridge_customer_listting(filters)
      customers = AnalogBridge::Customer.all(filters)

      expect(customers.offset).to eq(10)
      expect(customers.list.count).to eq(2)
      expect(customers.total_count).to eq(102)
      expect(customers.list.last.email).to eq("demo@analogbridge.io")
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
