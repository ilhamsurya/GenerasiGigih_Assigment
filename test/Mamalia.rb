class Mamalia
    attr_accessor :name

    def initialize(name)
        @name = name
    end

   def bernafas
        puts "Hewan Ini Bernafas"
    end 
end

module Terbang
    def terbang
        puts "Hewan ini bisa terbang"
    end

end