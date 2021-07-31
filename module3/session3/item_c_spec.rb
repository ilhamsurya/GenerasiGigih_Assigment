require_relative './app/controllers/item'
require_relative './app/model/item'
require_relative './db/db_connector'

describe ItemController do
  describe '#create' do
    before(:each) do
      client = create_db_client
      # client.query('DELETE FROM items')
    end
    context 'when given valid parameters' do
      before(:each) do
        params = {
          name => 'name',
          price => 'price',
          category_name => 'category',
          category_id => 1
        }
        controller = ItemController.new
        controller.create(params)
      end
      it 'should save item' do
        expected_item = Item.get_one
        expect(expected_item).not_to be_nil
      end
      it 'should render items page' do
        item = Item.get_all
        expected_view = ERB.new(File.read('./views/index.erb')).result
        expect(expected_view).to eq(response)
      end
      it 'should be return id = 30 and name mie_kocok' do
        item = Item.find
        dummy_database = double
        allow(Mysql2: Client).to_receive(:new).and return(dummy_database)
        expect(dummy_database).to_receive(:query).with("select * from items where id = ''")
        item.save
      end
    end
  end
end
