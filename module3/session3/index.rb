require 'sinatra'
require './app/controllers/item_controller'
require './app/controllers/category_controller'

###########################
####### ITEM ROUTE ########
###########################

## GET REQUEST 

get '/' do
    ItemController.all_item
end

get '/items/new' do
    ItemController.create()
end

get '/items/:id' do 
    ItemController.detail(params)
end

get '/items/:id/edit' do
    ItemController.edit(params)
end

## POST REQUEST 

post '/items/create' do
    ItemController.save(params)
    redirect '/'
end

post '/items/:id' do
    ItemController.update(params)
    redirect "/"
end

## DELETE REQUEST 

delete '/items/:id' do
    ItemController.delete(params)
    redirect "/"
end

###########################
##### CATEGORY ROUTE ######
###########################

## GET REQUEST 

get '/category/list' do
    CategoryController.all_category
end

get '/category/:id' do
    CategoryController.all_category_items(params)
end

get '/category/new' do
    CategoryController.create
end

get '/category/:id/edit' do
    CategoryController.edit(params)
end

## POST REQUEST 

post '/category/create' do
    CategoryController.save(params)
end

post '/category/:id' do
    CategoryController.update(params)
    redirect "/"
end
    
## DELETE REQUEST

delete '/category/:id' do
    CategoryController.delete(params)
    redirect "/"
end
