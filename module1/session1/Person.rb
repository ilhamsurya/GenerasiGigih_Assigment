class Person

    #attr_accessor : creates both the READER & WRITER methods
    #attr_reader :  creates only the reader.
    #attr_writer: creates only the writer.

    attr_accessor :name

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

    # implementation of encapsulation
    # encapsulation is hide the internal represantion or state of an object
    def reduce_hitpoint(damage)
        @hitpoint -= damage
    end

    def isDead()
        if @hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end

    def deflect()
        @deflect_percentage = rand(100)

        if @deflect_percentage <= 80
            puts "#{@name} deflect the attacks"
            true
        else
            false
        end
    end

end

def scenario_1(player,enemy)
    while not isDead
        
    end
end