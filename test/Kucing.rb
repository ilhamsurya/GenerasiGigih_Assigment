require './mamalia'

class Kucing < Mamalia

    def initialize(name,ras)
        super(name)
        @ras = ras
    end

    def bernafas
        puts "Kucing bernama #{self.name} ini bernafas"
    end
end

tama = Kucing.new("kuku", "kampung")
tama.bernafas