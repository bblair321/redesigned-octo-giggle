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
    @item3 = Item.new(name: 'Peach-Raspberry Nice Cream', price: "$5.30")
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 50)
    @vendor2.stock(@item1, 15)
    @vendor2.stock(@item3, 20)
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

  it "returns the total inventory with quantities and vendors selling each item" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)

    total_inventory = @market.total_inventory

    expect(total_inventory).to be_a(Hash)
    expect(total_inventory[@item1]).to have_key(:quantity)
    expect(total_inventory[@item1]).to have_key(:vendors)
    expect(total_inventory[@item1][:quantity]).to eq(50)
    expect(total_inventory[@item1][:vendors]).to include(@vendor1, @vendor2)

    expect(total_inventory[@item2]).to have_key(:quantity)
    expect(total_inventory[@item2][:quantity]).to eq(50)
    expect(total_inventory[@item2][:vendors]).to include(@vendor1)

    expect(total_inventory[@item3]).to have_key(:quantity)
    expect(total_inventory[@item3][:quantity]).to eq(20)
    expect(total_inventory[@item3][:vendors]).to include(@vendor2)
  end

  it "returns a sorted list of unique item names" do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)

    sorted_items = @market.sorted_item_list

    expect(sorted_items).to eq(['Peach','Peach-Raspberry Nice Cream', 'Tomato'])
  end
end