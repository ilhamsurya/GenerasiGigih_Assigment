require_relative '../test_helper'
require_relative '../../app/models/item'
require_relative '../../db/db_connector'

describe Item do
    describe '#validation' do
        context "with valid input" do
            it 'should return true if params filled' do
                item = Item.new({
                    'name' => 'item name',
                    'price' => '2000',
                    'category' => 1,
                })
                result = item.valid?
                expect(result).to eq(true)
            end
        end
       context "with invalid input" do
            it 'should return false if params empty' do
                item = Item.new({
                    'name' => '',
                    'price' => '',
                    'category' => '',
                })
                result = item.valid?
                expect(result).to eq(false)
            end
        end
    end
    describe '#save' do
        context 'with valid input' do
            it 'should return true and save data to db' do
                item = Item.new({
                    'name' => 'makanan',
                    'price' => '50000',
                    'category' => 1,
                })
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("INSERT INTO items(name, price) VALUES ('#{item.name}', #{item.price})")
                item.save
            end
        end
        context 'with invalid input' do
            it 'should return false and data not saved' do
                item = Item.new({
                    'name' => '',
                    'price' => '',
                    'category' => '',
                })
                result = item.save
                expect(result).to eq(false)
            end
        end
    end
    describe "#delete" do
        it "should delete item" do
            item = Item.new({
                'name' => 'test_barang',
                'price' => '50000',
                'id' => 30,
                'category' => '',
            })
            mock_client = double
            delete_categories = "delete from item_categories where item_id = #{item.id}"
            delete_item = "delete from items where id = #{item.id}"
            allow(Mysql2::Client).to receive(:new).and_return(mock_client)
            expect(mock_client).to receive(:query).with(delete_categories)
            expect(mock_client).to receive(:query).with(delete_item)
            item.delete
        end
    end
end