require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new(name: 'Peach', price: "$0.75")
    @item2 = Item.new(name: 'Tomato', price: "$0.50")
  end

  it "exists" do
    expect(@vendor).to be_a(Vendor)
  end

  it "has name" do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "has an inventory" do
    expect(@vendor.inventory).to eq({})
  end

  it "checks stock" do
    expect(@vendor.check_stock("item")).to eq(0)
  end

  it "can stock items in inventory" do
    @vendor.stock("item", 30)
    expect(@vendor.check_stock("item")).to eq(30)

    @vendor.stock("item1", 25)
    expect(@vendor.check_stock("item1")).to eq(25)
  end

  it "calculates potential revenue based on the inventory" do
    @vendor.stock(@item1, 35)
    @vendor.stock(@item2, 7)

    expected_revenue = (@item1.price.delete('$').to_f * 35) + (@item2.price.delete('$').to_f * 7)
  end
end