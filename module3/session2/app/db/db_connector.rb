require 'mysql2'
require './config/environment'

def create_db_client
  client = Mysql2::Client.new(
    host: 'localhost',
    username: 'admin',
    password: 'password',
    database: ENV["DB_NAME"]
  )
  client
end

