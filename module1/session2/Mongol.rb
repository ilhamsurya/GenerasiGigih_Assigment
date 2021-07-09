require_relative("person")

class Mongol < Person
    def initialize(name, hit_points, attack_damage)
        super(name, hit_points, attack_damage)
        @flee_percentage = 0.5
        @fled = false
    end

    def take_damage(damage)
        super(damage)
        if @hitpoint > 0 && @hitpoint < 50 
            flee if rand < @flee_percentage 
        end
    end

    def attack(enemy)
        super(enemy)
        @mongolian.attack
    end
    
    def flee
        @fled = true
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
    end

    def flee?()
        @fled  
    end
end

