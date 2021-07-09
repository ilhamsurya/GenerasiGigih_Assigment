require_relative "mongol"

class MongolSwordsman < Mongol
   def attack(enemy)
        puts "#{@name} thrusts #{enemy.name} with #{@attack_damage} damage" 
        enemy.take_damage(@attack_damage)
   end
end