require_relative '../db/db_connector'
require_relative './category.rb'

class Item
    attr_accessor :name, :price, :id, :category

    def initialize(name, price, id, category = nil)
        @name = name
        @price = price
        @id = id
        @category = category
    end
    ## CREATE New Item
    def self.create_new_item(name,price, category)
        client = create_db_client
        new_item = client.query("INSERT INTO items(name,price) VALUES('#{name}', '#{price}')")
        new_category = client.query("INSERT INTO item_categories(item_id, category_id) VALUES (LAST_INSERT_ID(), '#{category}') ")
    end
    ## GET All Item
    def self.get_all_items
        client = create_db_client
        rawData = client.query("select * from items")
        items = Array.new
        rawData.each do |data|
        item = Item.new(data["name"], data["price"], data["id"])
        items.push(item)
        end
        items
    end
    ## GET One Item
    def self.search_item_id(id)
        client= create_db_client
        rawData = client.query("SELECT items.*, categories.name as category_name, categories.id as category_id
        FROM items 
        JOIN item_categories ON items.id = item_categories.item_id 
        JOIN categories ON item_categories.category_id = categories.id
        WHERE items.id = '#{id}'")
        single_item = Array.new
        rawData.each do |data|
        item = Item.new(data["name"], data["price"], data["id"], data["category_name"])
        single_item.push(item)
        end
        single_item
    end
    ## GET cheaper item
    def self.get_cheaper_items(price)
        client = create_db_client
        rawData = client.query("select * from items where price < #{price}")
    end
    ## UPDATE Item
    def self.update_item(id, name, price, category)
        client= create_db_client
        updateData = client.query("
        UPDATE items 
        JOIN item_categories ON items.id = item_categories.item_id 
        JOIN categories ON item_categories.category_id = categories.id 
        SET items.name = '#{name}', items.price = '#{price}', item_categories.category_id = '#{category}' WHERE items.id = #{id}")
        updateData
    end 
    ## DELETE Item
    def self.delete_item(id)
        client= create_db_client
        updateData = client.query("
        DELETE FROM items WHERE id = #{id}")
        updateData
    end 







end