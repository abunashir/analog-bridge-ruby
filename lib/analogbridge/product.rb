module AnalogBridge
  class Product
    def all
      AnalogBridge.get_resource("products")
    end

    def self.all
      new.all
    end
  end
end
