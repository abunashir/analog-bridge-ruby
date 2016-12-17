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

    def update(customer_id, attributes = {})
      AnalogBridge.post_resource(
        ["customers", customer_id].join("/"), attributes
      ).data
    end

    def delete(customer_id)
      AnalogBridge.delete_resource(
        ["customers", customer_id].join("/"),
      ).data
    end
  end
end
