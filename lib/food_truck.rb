class FoodTruck
  attr_reader :name, :inventory
  def initialize(name, inventory = {})
    @name = name
    @inventory = inventory
  end

  def check_stock(item)
    return 0 if !@inventory[item]
    @inventory[item]
  end

  def stock(item, quantity)
    unless @inventory[item]
      @inventory[item] = 0
    end
    @inventory[item] += quantity
  end

  def potential_revenue
    price_collection = @inventory.transform_keys do |item|
      item.price
    end
    price_collection.sum do |price, quantity|
      price * quantity
    end
  end
end
