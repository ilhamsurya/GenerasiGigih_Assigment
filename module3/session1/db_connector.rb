require 'mysql2'
require './category'
require './item'

# class MyDatabase
  def create_db_client
    client = Mysql2::Client.new(
      host: 'localhost',
      username: 'admin',
      password: 'password',
      database: 'food_oms_db'
    )
    client
  end

  def get_all_items
    client = create_db_client
    rawData = client.query("select * from items")
    items = Array.new
    rawData.each do |data|
      item = Item.new(data["name"], data["price"], data["id"])
      items.push(item)
    end
    items
  end

  def create_new_item(name,price, category)
    client = create_db_client
    new_item = client.query("INSERT INTO items(name,price) VALUES('#{name}', '#{price}')")
    new_category = client.query("INSERT INTO item_categories(item_id, category_id) VALUES (LAST_INSERT_ID(), '#{category}') ")
    
  end

  def search_item_id(id)
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

  def update_item(id, name, price, category)
    client= create_db_client
    updateData = client.query("
      UPDATE items 
      JOIN item_categories ON items.id = item_categories.item_id 
      JOIN categories ON item_categories.category_id = categories.id 
      SET items.name = '#{name}', items.price = '#{price}', item_categories.category_id = '#{category}' WHERE items.id = #{id}")
    updateData
  end 

  def delete_item(id)
    client= create_db_client
    updateData = client.query("
       DELETE FROM items WHERE id = #{id}")
    updateData
  end 

  def get_all_categories
    client = create_db_client
    rawData = client.query("select * from categories")
    category_list = Array.new
    rawData.each do |data|
      category = Category.new(data["name"], data["id"])
      category_list.push(category)
    end
    category_list
  end
  # categories = get_all_categories()
  # puts categories.each

  def get_all_items_and_categories
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

  # items = get_all_items_and_categories
  # items.each do |item|
  #   puts(item.name)
  # end

  def get_cheaper_items(price)
    client = create_db_client
    rawData = client.query("select * from items where price < #{price}")
  
  end

  def select_all
    @hash = {}
    @array = []
    @query = @client.query('SELECT * FROM items ORDER BY id')
    @query.each do |a|
      @hash = { id: a['id'], nama: a['nama'] }
      @array << @hash
    end
    @array.to_json
  end
#  end
