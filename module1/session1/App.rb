require_relative "person"

jin = Person.new("Jin Sakai", 100, 50)
khotun = Person.new("Khotun Khan", 500, 50)

loop do
    jin.attack(khotun)
        puts khotun.profile()
        puts "\n"
    break if khotun.isDead

    if jin.deflect == true
        jin.deflect()
    else
        khotun.attack(jin)
        puts jin.profile()
        puts "\n"
        break if jin.isDead
    end
end
