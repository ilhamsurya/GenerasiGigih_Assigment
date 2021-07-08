require_relative("samurai")

class Player < Samurai

    def initialize(name,hitpoint,attack_damage)
        super(name,hitpoint,attack_damage)
        @deflect_percentage = 80
        @heal_point = 100
    end

    def reduce_hitpoint(damage)
        if rand(1..100) < @deflect_percentage
            puts "#{@name} deflect the attacks"
        else
            super(damage)
        end
    end 
    
    def player_move()
        puts "As #{@name}, what do you want to do this turn?"
        puts "1) Attack an enemy"
        puts "2) Heal an ally"
        move = gets.chomp.to_i
        if move == 1
            return 1
        elsif move == 2
            return 2
        else
            puts "command not found"
        end
    end

    def choose_target()
        puts "Which enemy you want to attack?"
        puts "1) Mongol Archer"
        puts "2) Mongol Spearman"
        puts "3) Mongol Swordsman"
        target = gets.chomp.to_i
        return target
    end

    def heal_target(jin_allies)
        puts "Which ally you want to heal?"
        i = 1
        
        jin_allies.each do |ally|
        puts "#{i}) #{ally.name}"
        i += 1
        end
        heal_target = gets.chomp.to_i
        heal_target -= 1
        return heal_target
    end

    def heal(jin_allies,heal_target)
        ally = jin_allies[heal_target]
        puts "#{@name} heals #{ally.name} restoring #{@heal_point} hitpoints"
        ally.hitpoint += @heal_point
    end
end