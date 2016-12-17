module AnalogBridge
  class Order < AnalogBridge::Base
    def where(customer_id:)
      AnalogBridge.get_resource(
        ["customers", customer_id, "orders"].join("/"),
      )
    end
  end
end
