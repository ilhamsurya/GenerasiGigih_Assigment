require_relative '../models/item'
require_relative '../db/db_connector'

class ItemController < Sinatra::Application
    # Setup new path for views
    configure do
        set :views, 'app/views'
    end

    get '/' do
        erb :index, locals: {
            items: Item.get_all_items
        }
    end

    get '/items/new' do
        erb :create, locals: {
            categories: Category.get_all_categories
        }
    end

    post '/items/create' do
        name = params['name']
        price = params['price']
        category = params['category']
        Item.create_new_item(name,price,category)
        redirect '/'
    end


    get '/items/new' do
        erb :"components/create", locals: {
            categories: Category.get_all_categories
        }
    end

    get '/items/:id' do 
        id = params[:id]
        erb :detail, locals: {
            items: Item.search_item_id(id)
        }
    end

    get '/items/:id' do
        id = params[:id]
        items = Item.get_by_id(id)
        erb :"components/item_details", locals: {
            items: items
        }
    end

    get '/items/:id/edit' do
        id = params[:id] 
        items = Item.search_item_id(id)
        category = Category.get_all_categories
        erb :update, locals: {
            items: items,
            categories: category
        }
    end

    post '/items/:id' do
        id = params[:id]
        name = params['name']
        price = params['price']
        category = params['category']
        Item.update_item(id, name, price, category)
        redirect '/'
    end
    
    delete '/items/:id' do
        Item.delete_item(params[:id])
        redirect "/"
    end

end