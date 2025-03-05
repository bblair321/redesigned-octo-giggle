require 'pry'
class Market
  attr_reader :name, :vendors
  def initialize(name, vendors = [])
    @name = name
    @vendors = vendors
    @names = []
  end 

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names_array = [] #created a new array for the vendor names
    @vendors.each do |vendor|
      vendor_names_array << vendor.name
    end
    vendor_names_array
  end

  def vendors_that_sell(item)
    vendors_that_sell = []  # create an empty array
    @vendors.each do |vendor|  # Iterate through each vendor in the vendors array
      # Check if the vendor has stock for the specified item.
      if vendor.check_stock(item) > 0
        vendors_that_sell << vendor  # If the vendor has the item in stock, add the vendor to the vendors_that_sell
      end
    end
    vendors_that_sell  # Returns the array
  end

  def total_inventory
    total_inventory = {}  # an empty hash
    @vendors.each do |vendor|  # go through each vendor in the market.
      vendor.inventory.each do |item, quantity|  #  go through each item and quanitity in inventory
        if total_inventory[item]  # Check if the item already exists in the total_inventory hash.
          total_inventory[item][:quantity] += quantity  # If it exists, add the quantity to the total.
          total_inventory[item][:vendors] << vendor  # Add the current vendor to the list of vendors selling the item.
        else
          total_inventory[item] = { quantity: quantity, vendors: [vendor] }  # If the item doesn’t exist, create a new entry.
        end
      end
    end
    total_inventory  # Return the hash.
  end

  def sorted_item_list
    items = []

    @vendors.each do |vendor|
      vendor.inventory.each_key do |item|
        items << item.name
      end
    end

    items.uniq.sort
  end

end