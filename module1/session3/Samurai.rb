require_relative("person")

class Samurai < Person

    def initialize(name,hitpoint,attack_damage, heal_point = 20, deflect_percentage = 80)
        super(name,hitpoint,attack_damage)
        @deflect_percentage = deflect_percentage
        @heal_point = heal_point
    end

    def take_damage(damage)
        if rand < @deflect_percentage
            deflect
        else
            super(damage)
        end
    end

    def deflect
        puts "#{@name} deflects the attack"
    end

    def heal(other_hero)
        other_hero.take_healing(@heal_point)
    end
end