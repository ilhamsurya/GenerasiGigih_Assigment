class Person

    #attr_accessor : creates both the READER & WRITER methods
    #attr_reader :  creates only the reader.
    #attr_writer: creates only the writer.


    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def profile()
        puts "#{@name} has #{@hitpoint} and #{@attack_damage} attack damage"
    end

    def attack(enemy)
        enemy.reduce_hitpoint(@attack_damage)
        puts "#{@name} attacks #{enemy.name} with #{@attack_damage} damage"
    end

    def reduce_hitpoint(damage)
        @hitpoint -= damage
    end

    def isDead()
        if hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end

end

def scenario_1(player,enemy)
    while not isDead
        
    end
end