require_relative '../lib/mairie.rb'

describe "depute" do 
  it "It should return an array of hash" do
    expect(depute.all? { |elem| elem.class == Hash }).to be true
    expect((depute)).to be_a_kind_of Array
  end
  it "It should return at least the first town of all the list with the email" do
    expect(depute[0]).to eq("first_name" => "Damien", "last_name" => "mairie.ableiges95@wanadoo.fr", "email" => "damien.abad@assemblee-nationale.fr")
  end
  it "It should return 185 town" do
    expect(depute.count).to eq(577)
  end
end