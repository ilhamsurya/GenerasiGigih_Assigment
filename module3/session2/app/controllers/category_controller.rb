require 'sinatra'
require_relative '../db/db_connector'

class CategoryController < Sinatra::Application

    configure do
        set :views, 'app/views'
    end


end