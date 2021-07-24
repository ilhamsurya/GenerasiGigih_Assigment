require_relative '../models/item'
require_relative '../../db/db_connector'


class ItemController < Sinatra::Application
    # Setup new path for views
    def self.all_item()
        items = Item.get_all
        renderer = ERB.new(File.read("./app/views/index.erb"))
        renderer.result(binding)
    end

    def self.create()
        categories = Category.get_all
        renderer = ERB.new(File.read("./app/views/items/create.erb"))
        renderer.result(binding)
    end

    def self.save(params)
        name = params['name']
        price = params['price']
        category = params['category']
        item = Item.new(nil,name,price,category)
        item.create(name,price,category)

    end

    def self.detail(params)
        id = params['id']
        items = Item.get_one(id)
        renderer = ERB.new(File.read("./app/views/items/detail.erb"))
        renderer.result(binding)
    end

    def self.edit(params)
        id = params['id']
        items = Item.get_one(id)
        categories = Category.get_all
        renderer = ERB.new(File.read("./app/views/items/update.erb"))
        renderer.result(binding)
        
    end

    def self.update(params)
        id = params['id']
        name = params['name']
        price = params['price']
        category = params['category']
        Item.update(id, name, price, category)
  
    end

    def self.delete(params)
        id = params['id']
        Item.delete(id)
 
    end
    
end