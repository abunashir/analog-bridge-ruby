module AnalogBridge
  class Customer < AnalogBridge::Base
    def create(attributes = {})
      AnalogBridge.post_resource("customers", attributes).data
    end

    def find(customer_id)
      AnalogBridge.get_resource(
        ["customers", customer_id].join("/"),
      )
    end
  end
end
