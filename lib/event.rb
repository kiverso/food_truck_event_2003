class Event
  attr_reader :name, :food_trucks
  def initialize(name, food_trucks = [])
    @name = name
    @food_trucks = food_trucks
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def all_items
    items = @food_trucks.map { |truck| truck.inventory.keys }
    # require "pry"; binding.pry
    items.flatten.uniq
  end

  def sorted_item_list
  items = all_items.map { |item| item.name }
  items.sort
  end

  def total_inventory
    inventory = {}
    all_items.each do |item|
      unless inventory[item]
        inventory[item] = {quantity: 0, food_trucks: food_trucks_that_sell(item) }
      end
      inventory[item][:quantity] = @food_trucks.sum{|truck| truck.check_stock(item)}
    end
    inventory
  end
end
