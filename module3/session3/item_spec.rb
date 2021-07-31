require_relative './app/models/item'
require_relative './db/db_connector'

describe Item do
    describe '#create' do
        context "when create successful" do
            it "succesfuly create item name ayam bakar madu, price = 15000" do
               client = create_db_client
               itemA = Item.new("ayam bakar madu", 15000, 15)
               itemA.create(itemA.name, itemA.price, 1)
               expect(itemA.name).to eq(itemA.name)
               expect(itemA.price).to eq(itemA.price)
            end 
        end
    end
    describe '#update' do
        context "when update successful" do
            it "should change name from nasi goreng A to nasi goreng B" do
               client = create_db_client
                itemA = Item.new("nasi goreng A", 15000, 29)
                itemB = Item.new("nasi goreng B", 20000, 29)
                itemA.create(itemA.name, itemA.price, 1)
                itemA.update(itemA.id, itemB.name, itemB.price, 1)
               expect(itemA.name).to eq(itemB.name)
            end 
        end
    end

end
