module Analogbridge
  class Product
    def all
      Analogbridge.get_resource("products")
    end

    def self.all
      new.all
    end
  end
end
