class Person

    #attr_accessor : creates both the READER & WRITER methods
    #attr_reader :  creates only the reader.
    #attr_writer: creates only the writer.

    attr_accessor :name ,:hitpoint, :attack_damage

    def initialize(name, hitpoint, attack_damage)
        # the name,hitpoint and attack damage are called instances variables or state
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    # implementation of encapsulation attribute reader method
    def to_s()
        puts "#{@name} has #{@hitpoint} hitpoints and #{@attack_damage} attack damage"
    end

    def attack(enemy)
        puts "#{@name} attacks #{enemy.name} with #{@attack_damage} damage"
        enemy.take_damage(@attack_damage)
    end

    # implementation of encapsulation
    # encapsulation is hide the internal represantion or state of an object
    def take_damage(damage)
        @hitpoint -= damage
    end

    def die?
        if @hitpoint <= 0
        puts "#{@name} dies"
        true
        end
    end

end