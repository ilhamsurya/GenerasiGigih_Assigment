require_relative "mongol"

class MongolArcher < Mongol
   def attack(enemy)
        puts "#{@name} shoots an arrow at #{enemy.name} with #{@attack_damage} damage" 
        enemy.reduce_hitpoint(@attack_damage)
   end
end