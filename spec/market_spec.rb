require './lib/vendor'
require './lib/item'
require './lib/market'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market") 
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @item1 = Item.new(name: 'Peach', price: "$0.75")
    @item2 = Item.new(name: 'Tomato', price: "$0.50")
    @vendor1.stock(@item1, 35) # Vendor 1 sells peaches
    @vendor2.stock(@item2, 50)
  end

  it "exists" do
    expect(@market).to be_a(Market)
  end

  it "has name" do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
  end

  it "has empty vendors array" do
    expect(@market.vendors).to eq([])
  end

  it "adds a vendor to the vendors array" do
    @market.add_vendor(@vendor)
    @market.add_vendor(@vendor2)
    expect(@market.vendors).to include(@vendor,@vendor2)
  end

  it "returns the names of vendors" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom"])
  end

  it "returns vendors that sell" do
    @market.add_vendor(@vendor1)

    sellers = @market.vendors_that_sell(@item1)
    expect(sellers).to include(@vendor1)
  end


end