require 'sinatra'

class App < Sinatra::Application

    configure do
        set :views, 'app/views'
    end
    
    get "/" do
        erb :index
    end

end