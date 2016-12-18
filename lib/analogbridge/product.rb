module AnalogBridge
  class Product < AnalogBridge::Base
    def list
      AnalogBridge.get_resource("products")
    end
  end
end
