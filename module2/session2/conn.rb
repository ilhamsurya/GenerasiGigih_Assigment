require 'mysql2'

class MyDatabase
  def initialize
    @client = Mysql2::Client.new(
      host: 'localhost',
      username: 'admin',
      password: 'password',
      database: 'sample_database'
    )
  end

  def select_all
    @hash = {}
    @array = []
    @query = @client.query('SELECT * FROM orang ORDER BY id')
    @query.each do |a|
      @hash = { id: a['id'], nama: a['nama'] }
      @array << @hash
    end
    @array.to_json
  end
end
