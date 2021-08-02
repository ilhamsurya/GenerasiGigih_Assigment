require_relative '../test_helper'
require_relative '../../app/models/item'
require_relative '../../db/db_connector'

describe Item do
  describe "#validation" do
    context "when initialize valid parameter" do
      it "should return true" do
          item = Item.new(99,"Gurame Bakar",55000)
          expect(item.valid?).to eq(true)
        end
      end
    context "when initialize invalid parameter" do
      it "should return false" do
          item = Item.new("Gurame Bakar",nil)
          expect(item.valid?).to eq(false)
      end
    end
  end

  describe '#save' do
    context 'when saving valid item' do
      it 'should use mock sql client to insert item' do
          mock_client = double
          params = {
            "name" => "Gurame Bakar",
            "price" => 125000,
            "id" => 99,
            "category" => 1
          }
          insert = "insert into items (name, price) values ('#{params["name"]}', #{params["price"]})"
          allow(Mysql2::Client).to receive(:new).and_return(mock_client)
          expect(mock_client).to receive(:query).with(insert)
          ItemController.save(params)
      end
    end
  end
  describe '#update' do
    context 'when update valid item' do
      it 'should use mock sql client to update item' do

      end
    end
  end
end
