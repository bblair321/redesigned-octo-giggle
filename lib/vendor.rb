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
end