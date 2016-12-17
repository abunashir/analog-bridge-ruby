module AnalogBridge
  class Order < AnalogBridge::Base
    def where(customer_id:, order_id: nil)
      AnalogBridge.get_resource(
        ["customers", customer_id, "orders", order_id].compact.join("/"),
      )
    end
  end
end
