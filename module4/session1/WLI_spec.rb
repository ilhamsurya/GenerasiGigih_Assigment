require_relative './WLI'

describe WLI do
    it "zero person like" do
        wli = WLI.new()
        likes = wli.likes
        expect(likes).to eq("no one likes this")
    end
    it "one person like" do
        wli = WLI.new()
        wli.names = ['Peter']
        likes = wli.likes
        expect(likes).to eq("Peter likes this")
    end
    it "two persons like" do
        wli = WLI.new()
        wli.names = ["Jacob", "Alex"]
        likes = wli.likes
        expect(likes).to eq("Jacob and Alex likes this")
    end
    it "three persons like" do
        wli = WLI.new()
        wli.names = ["Jacob", "Alex", "Derek"]
        likes = wli.likes
        expect(likes).to eq("Jacob, Alex and one other like this")
    end
    it "four persons like" do
        wli = WLI.new()
        wli.names = ["Jacob", "Alex", "Derek", "Smith"]
        likes = wli.likes
        expect(likes).to eq("Jacob, Alex and two others like this")
    end
end