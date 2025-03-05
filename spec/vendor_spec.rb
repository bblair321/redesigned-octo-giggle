require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new
  end

  it "exists" do
    expect(@vendor).to be_a(Vendor)
  end

  xit "has attributes" do
    expect(@artist.id).to eq("2")
    expect(@artist.name).to eq("Ansel Adams")
    expect(@artist.born).to eq("1902")
    expect(@artist.died).to eq("1902")
    expect(@artist.country).to eq("United States")
  end
end