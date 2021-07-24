require 'sinatra'
require_relative '../db/db_connector'

class CategoryController < Sinatra::Application

    configure do
        set :views, 'app/views'
    end
    def self.all_category()
        categories = Category.get_all_categories 
        renderer = ERB.new(File.read("./views/list_category.erb"))
        renderer.result(binding)
    end
    def self.all_category_items()
        categories = Category.get_all_items_and_categories 
        renderer = ERB.new(File.read("./views/list_category_items.erb"))
        renderer.result(binding)
    end
    def self.create_category_page()
        renderer = ERB.new(File.read("./views/create_category.erb"))
        renderer.result(binding)
    end
    def self.create_category(params)
        id = params['id']
        name = params['name']
        category = Category.new(name,id)
        category.create_new_category(name,id)
    end
    def self.find_with_items(id)
        
    end

end