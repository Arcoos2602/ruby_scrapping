require_relative '../lib/mairie.rb'

describe "get_townhall" do 
  it "It should return an array of hash" do
    expect(get_townhall.all? { |elem| elem.class == Hash }).to be true
    expect((get_townhall)).to be_a_kind_of Array
  end
  it "It should return at least the first town of all the list with the email" do
    expect(get_townhall[0]).to eq("ABLEIGES" => "mairie.ableiges95@wanadoo.fr")
  end
  it "It should return 185 town" do
    expect(get_townhall.count).to eq(185)
  end
end
