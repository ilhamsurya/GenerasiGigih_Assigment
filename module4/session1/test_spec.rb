require_relative './martabak'

describe Martabak do 
    it "is Delicious" do
        martabak = Martabak.new("telor")
        taste = martabak.taste
        expect(taste).to eq("martabak telor is delicious")
    end
end