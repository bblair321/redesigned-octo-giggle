require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item = Item.new
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it "exists" do
    expect(@item).to be_a(Item)
  end

  it "has attributes" do
    expect(@item1.name).to eq("Peach")
    expect(@item2.name).to eq("Tomato")
    expect(@item2.price).to eq("$0.50")
    expect(@item1.price).to eq("$0.75")
  end
end