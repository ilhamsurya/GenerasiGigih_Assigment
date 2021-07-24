require_relative '../../db/db_connector'

class Category
    attr_accessor :name, :id

    def initialize(name, id)
        @name = name
        @id = id
    end
    ## CREATE New Item
    def create(name)
        client = create_db_client
        new_item = client.query("INSERT INTO categories(name) VALUES('#{name}')")
    end

    def self.get_one(id)
        client= create_db_client
        rawData = client.query("SELECT * from categories WHERE categories.id = '#{id}'")
        single_category = Array.new
        rawData.each do |data|
        category = Category.new(data["name"], data["id"])
        single_category.push(category)
        end
        single_category
    end
    
    def self.get_all
        client = create_db_client
        rawData = client.query("select * from categories")
        category_list = Array.new
        rawData.each do |data|
        category = Category.new(data["name"], data["id"])
        category_list.push(category)
        end
        category_list
    end

    ## UPDATE Item
    def self.update(id, name)
        client= create_db_client
        updateData = client.query("
        UPDATE categories 
        SET categories.name = '#{name}' WHERE categories.id = #{id}")
        updateData
    end 

    ## DELETE Item
    def self.delete(id)
        client= create_db_client
        deleteData = client.query("
        DELETE FROM categories WHERE id = #{id}")
        deleteData
    end 

    def self.get_with_item(id)
        client = create_db_client
        rawData = client.query("select items.id, items.name, items.price, categories.name as category_name, categories.id as category_id
        from items 
        join item_categories on items.id = item_categories.item_id 
        join categories on item_categories.category_id = categories.id
        WHERE categories.id = #{id}")
        items = Array.new
        
        rawData.each do |data|
        category = Category.new(data["category_name"], data["category_id"])
        item = Item.new(data["name"], data["price"], data["id"], category)
        items.push(item)
        end
        items
    end
end