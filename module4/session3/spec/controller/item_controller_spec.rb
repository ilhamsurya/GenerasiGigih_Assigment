require_relative '../test_helper'
require_relative '../../app/controllers/item_controller'
require_relative '../../app/models/item'

describe ItemController do
  describe '#display' do
    context 'when check the restaurant item' do
      it 'should display all the item in the menu' do
        controller = ItemController.new
        actual_views = contoller.get_all
        expected_view = ERB.new(File.read('./app/views/items/index.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
    end
  end
  describe '#create' do
    context 'when items input are valid' do
      it 'should render to create page' do
        actual_views = contoller.get_all
        expected_view = ERB.new(File.read('./app/views/items/create.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
      it 'should save item' do
        params = {
          'name' => 'name',
          'price' => 'price',
          'category_id' => '1'
        }
        controller = ItemController.new
        controller.create_item(params)
      end
    end
  end
  describe '#update' do
    context 'when items input are valid' do
      it 'should render to update page' do
        actual_views = contoller.get_all
        expected_view = ERB.new(File.read('./app/views/items/update.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
      it 'should update item' do
        new_item = Item.new('nasi bakar', 25_000, 1)
        updated_item = Item.new('nasi bakar madu', 30_000, 1)
        params = {
          'id' => new_item.id,
          'name' => updated_item.name,
          'price' => updated_item.price,
          'categories_id' => 1
        }
        @item.update(params)
        expect(new_item).to eq(@item)
      end
    end
  end
end
