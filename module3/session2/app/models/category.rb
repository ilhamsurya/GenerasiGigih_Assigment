require_relative '../db/db_connector'

class Category
    attr_accessor :name, :id

    def initialize(name, id)
        @name = name
        @id = id
    end

    def self.get_category_by_id(id)
        client = create_db_client
        rawData = client.query("select * from categories where id = '#{id}'")
        one_category = Array.new
        rawData.each do |data|
        category = Category.new(data["name"], data["id"])
        one_category.push(category)
        end
        one_category
    end
    
    def self.get_all_categories
        client = create_db_client
        rawData = client.query("select * from categories")
        category_list = Array.new
        rawData.each do |data|
        category = Category.new(data["name"], data["id"])
        category_list.push(category)
        end
        category_list
    end

    def self.get_all_items_and_categories
        client = create_db_client
        rawData = client.query("select items.id, items.name, categories.name as category_name, categories.id as category_id
        from items 
        join item_categories on items.id = item_categories.item_id 
        join categories on item_categories.category_id = categories.id")
        items = Array.new
        
        rawData.each do |data|
        category = Category.new(data["category_name"], data["category_id"])
        item = Item.new(data["name"], data["price"], data["id"], category)
        items.push(item)
        end
        items
    end
end