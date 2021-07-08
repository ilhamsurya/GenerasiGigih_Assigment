require_relative("person")

class Mongol < Person
    def intialize(name, hitpoint, attack_damage)
        super(name,hitpoint,attack_damage)
        @fled = false
    end

    def reduce_hitpoint(damage)
        super(damage)
        if @hitpoint <= 50 && rand(100) <= 50
            flee 
        end
    end

    def attack(enemy)
        super(enemy)
        @mongolian.attack
    end

    def flee
        @flee = true
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
    end

    def flee?
        @fled
    end
end

