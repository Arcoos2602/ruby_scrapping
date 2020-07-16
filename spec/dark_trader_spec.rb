require_relative '../lib/dark_trader'

describe "crypto_scrapper" do
  it "It should return an array of hash" do
    expect(crypto_scrapper.all? { |elem| elem.class == Hash }).to be true
    expect((crypto_scrapper)).to be_a_kind_of Array 
  end
  it "The first and second elements are" do
    expect((crypto_scrapper[0]).key?("Bitcoin")).to eq true
    expect((crypto_scrapper[1]).key?("Ethereum")).to eq true
  end
  it "There are 200 crypto" do
    expect(crypto_scrapper.count).to eq (200)
  end
end
