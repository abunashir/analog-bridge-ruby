module AnalogBridge
  class Product < AnalogBridge::Base
    def all
      AnalogBridge.get_resource("products")
    end
  end
end
