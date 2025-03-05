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
    vendors_that_sell = []
    @vendors.each do |vendor|
      # Check if the vendor's inventory includes the item
      if vendor.check_stock(item) > 0
        vendors_that_sell << vendor
      end
    end
    vendors_that_sell
  end

  # def potential_revenue
  #   total_revenue = 0
  #   @vendors.each do |vendor|
  #     vendor.inventory.each do |item, quantity|
  #       total_revenue += item.price.to_f * quantity
  #     end
  #   end
  #   total_revenue
  # end

end