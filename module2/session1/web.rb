require 'sinatra'
require 'sinatra/reloader' if development?

# get '/' do
# "Hello, world!"
# end

# get '/:name' do
# "Hello, #{params[:name]}!"
# end

get '/items' do
  erb :items
end
post '/items' do
  "pada tanggal #{params[:tanggal]} #{params[:nama]} membeli #{params[:barang1]} dan #{params[:barang2]}"
end
get '/login' do
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Berhasil login'
  else
    raise 'Gagal login'
    redirect '/login'
  end
end
