require 'test.rb'
describe Dog do
  let(:dog) { Dog.new("Bear") }

  describe "name property" do
    it "allows us to manipulate name" do
      dog.name = "Rocky"
      expect(dog.name).to eq("Rocky")
    end

    it "allows us to read the name" do
      expect(dog.name).to eq("Rocky")
    end
  end
end
