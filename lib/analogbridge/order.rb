module AnalogBridge
  class Order < AnalogBridge::Base
    def import_ready
      AnalogBridge.get_resource("orders/import-ready")
    end

    def where(customer_id:, order_id: nil)
      AnalogBridge.get_resource(
        ["customers", customer_id, "orders", order_id].compact.join("/"),
      )
    end
  end
end
