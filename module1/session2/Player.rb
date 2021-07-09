require_relative("samurai")

class Player < Samurai

    def initialize(name,hitpoint,attack_damage, heal_point = 100, deflect_percentage = 80)
        super(name,hitpoint,attack_damage)
        @deflect_percentage = deflect_percentage
        @heal_point = heal_point
    end

    def take_damage(damage)
        if rand(1..100) < @deflect_percentage
            puts "#{@name} deflect the attacks"
        else
            super(damage)
        end
    end 
    # Choose what to do for player
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
    # Choose attacking target
    def choose_target(jin_enemy)
        puts "Which enemy you want to attack?"        
        jin_enemy.each_with_index  do |enemy, index|
            puts "#{index + 1}) #{enemy.name}"
        end
        target = gets.chomp.to_i - 1
        return target
    end
    # Choose heal target
    def heal_target(jin_allies)
        puts "Which ally you want to heal?"
    
        jin_allies.each_with_index do |ally, index|
            puts "#{index + 1}) #{ally.name}"
        end

        heal_target = gets.chomp.to_i - 1
        return heal_target
    end
    # Healing Allies
    def heal(jin_allies,heal_target)
        ally = jin_allies[heal_target]
        puts "#{@name} heals #{ally.name} restoring #{@heal_point} hitpoints"
        ally.hitpoint += @heal_point
    end
end