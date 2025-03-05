require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item = Item.new
  end

  it "exists" do
    expect(@item).to be_a(Item)
  end

  xit "has attributes" do
    expect(@artist.id).to eq("2")
    expect(@artist.name).to eq("Ansel Adams")
    expect(@artist.born).to eq("1902")
    expect(@artist.died).to eq("1902")
    expect(@artist.country).to eq("United States")
  end
end