require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'conn'


get '/' do
  return 'Hello from Sinatra.rb'
end

get '/show_data' do
  content_type :json
  @database = MyDatabase.new
  return @database.select_all
end

