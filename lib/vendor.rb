class Vendor
  attr_reader :name, :inventory

  def initialize(name, inventory = {})
    @name = name
    @inventory = inventory
  end

  def check_stock(item)
    @inventory[item] || 0
  end

  def stock(item, quantity)
    @inventory[item] ||=0
    @inventory[item] += quantity
  end

  def potential_revenue
    total_revenue = 0
    @inventory.each do |item, quantity|
    price = item.price.delete('$').to_f  # Remove the dollar sign and convert to float
    total_revenue += price * quantity
  end
  total_revenue
  end
end