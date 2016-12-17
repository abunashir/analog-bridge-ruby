module AnalogBridge
  class Customer < AnalogBridge::Base
    def create(attributes = {})
      AnalogBridge.post_resource("customers", attributes).data
    end
  end
end
