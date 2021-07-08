require_relative "mongol"

class MongolSpearman < Mongol
   def attack(enemy)
        puts "#{@name} slashes #{enemy.name} with #{@attack_damage} damage" 
        enemy.reduce_hitpoint(@attack_damage)
   end
end