require_relative '../test_helper'
require_relative '../../app/controllers/item_controller'
require_relative '../../app/models/item'
require_relative '../../db/db_connector'

describe ItemController do
  describe '#display' do
    context 'when check the restaurant item' do
      it 'should display all the item in the menu' do
        items = Item.get_all
        actual_view = ItemController.all_item
        expected_view = ERB.new(File.read('./app/views/index.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
    end
  end
  describe '#create' do
    context 'when create new item' do
      it 'should render the create page' do
        categories = Category.get_all
        actual_view = ItemController.create
        expected_view = ERB.new(File.read('./app/views/items/create.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
    end
  end
  describe '#detail' do
    context 'when see item detail information' do
      it 'should render the detail page' do
        params = {
            "id" => "99"
        }
        items = Item.get_one(params["id"])
        categories = Category.get_all
        actual_view = ItemController.detail(params["id"])
        expected_view = ERB.new(File.read('./app/views/items/detail.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
    end
  end
  describe '#edit' do
    context 'when edit item' do
      it 'should render the edit page' do
        params = {
            "id" => "99"
        }
        items = Item.get_one(params["id"])
        categories = Category.get_all
        actual_view = ItemController.edit(params["id"])
        expected_view = ERB.new(File.read('./app/views/items/update.erb')).result(binding)
        expect(expected_view).to eq(actual_view)
      end
    end
  end
  describe '#save' do
    context 'with valid input' do
      it 'should create new item and save to db' do
        item_mock = double
        params = {
            "name" => "Gurame Bakar",
            "price" => 125000,
            "id" => nil,
            "category" => 1
        }
        expect(Item).to receive(:new).with(params["id"],params["name"], params["price"],params["category"]).and_return(item_mock)
        allow(item_mock).to receive(:save) 
        ItemController.save(params)
      end
    end
    context 'with invalid input' do
      it 'should return false' do
        item_mock = double
        params = {
            "name" => nil,
            "price" => 9000,
            "category" => 1
        }
        item = ItemController.save(params)
        expect(item).to eq(nil)
      end
    end
  end
  describe '#update' do
    context 'with valid input' do
      it 'should update the item and save to db' do
        item_mock = double
        params = {
            "name" => "Gurame Bakar",
            "price" => 125000,
            "id" => 9,
            "category" => 1
        }
        updated_params = {
            "name" => "Gurame Goreng",
            "price" => 99000,
            "id" => 9,
            "category" => 1
        }
        expect(Item).to receive(:get_one).with(params["id"]).and_return(item_mock)
        allow(item_mock).to receive(:update).with(updated_params["name"], updated_params["price"],updated_params["category"]) 
        ItemController.update(params)
      end
    end
    context 'with invalid input' do
      it 'should return false' do
        item_mock = double
        params = {
            "name" => "Gurame Bakar",
            "price" => 125000,
            "id" => 9,
            "category" => 1
        }
        updated_params = {
            "name" => nil,
            "price" => 99000,
            "id" => nil,
            "category" => 1
        }
        item = ItemController.update(params)
        expect(item).to eq(nil)
      end
    end
  end
  describe ".delete" do
      context "when item id is valid" do
          it "should delete the item with id" do
              params = {
                  "id" => 9
              }
              mock_item = double
              expect(Item).to receive(:get_one).with(params["id"]).and_return(mock_item)
              allow(mock_item).to receive(:delete)

              ItemController.delete(params)
          end
      end
  end
end