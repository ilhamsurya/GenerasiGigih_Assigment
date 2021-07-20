require 'sinatra'
require './db_connector'

get '/' do
    items = get_all_items
    erb :index, locals: {
        items: items
    }
end
get '/items/new' do
    category = get_all_categories
    erb :create, locals: {
        categories: category
    }
end

post '/items/create' do
    name = params['name']
    price = params['price']
    new_items = create_new_item(name,price)
    redirect '/'
end

get '/items/:id' do 
    items = search_item_id(params[:id])
    erb :detail, locals: {
        items: items
    }
end

get '/items/:id/edit' do 
    items = search_item_id(params[:id])
    category = get_all_categories
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
    update_item(id, name, price, category)
    redirect '/'
end

delete '/items/:id' do
  items = delete_item(params[:id])
  redirect "/"
end