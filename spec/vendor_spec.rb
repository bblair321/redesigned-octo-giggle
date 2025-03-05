require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    
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
end