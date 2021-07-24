require 'sinatra'
require_relative '../../db/db_connector'

class CategoryController < Sinatra::Application

    def self.all_category()
        categories = Category.get_all 
        renderer = ERB.new(File.read("./app/views/category/list.erb"))
        renderer.result(binding)
    end

    def self.all_category_items(params)
        id = params['id']
        categories_item = Category.get_with_item(id)
        renderer = ERB.new(File.read("./app/views/category/list_item.erb"))
        renderer.result(binding)
    end

    def self.create()
        renderer = ERB.new(File.read("./app/views/category/create.erb"))
        renderer.result(binding)
    
    end

    def self.save(params)
        name = params['name']
        category = Category.new(nil,name)
        category.create(name)
        redirect '/category/list'
    end

    def self.edit(params)
        id = params['id']
        categories = Category.get_one(id)
        renderer = ERB.new(File.read("./app/views/category/update.erb"))
        renderer.result(binding)
    end

    def self.update(params)
        id = params['id']
        name = params['name']
        Category.update(id, name)
        redirect '/category/list'
    end

    def self.delete(params)
        id = params['id']
        Category.delete(id)
        redirect '/category/list'
    end

    

end