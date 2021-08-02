require 'mysql2'

require_relative '../config/environment'



def create_db_client

  Mysql2::Client.new(

    host: 'localhost',

    username: 'admin',

    password: 'password',

    database: ENV['DB_NAME']

  )

end

