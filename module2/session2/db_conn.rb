require 'mysql2'

class MyDatabase
  def initialize
    @client = Mysql2::Client.new(
      host: 'localhost',
      username: 'root',
      password: 'yourpassword',
      database: 'sinatra'
    )
  end

  def select_all_komedian
    @hash = {}
    @array = []
    @query = @client.query('SELECT * FROM komedian ORDER BY id')
    @query.each do |a|
      @hash = { id: a['id'], nama: a['nama'] }
      @array << @hash
    end
    @array.to_json
  end
end
