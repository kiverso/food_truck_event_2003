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
end
