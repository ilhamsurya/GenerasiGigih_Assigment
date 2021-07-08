# Session 2 07/07/2021
# Talked about implementation of Inheritance & Polymorphism in OOP
require_relative "Person"
require_relative "Player"
require_relative "Samurai"
require_relative "Mongol"
require_relative "Mongol_archer"
require_relative "Mongol_spearman"
require_relative "Mongol_swordsman"

jin = Player.new("Jin Sakai", 100, 50)
yuna = Samurai.new("Yuna", 90, 45)
sensei = Samurai.new("Sensei Ishikawa", 80, 60)
# khotun = Mongol.new("Khotun Khan", 500, 50)
mongol_archer = MongolArcher.new("Mongol Archer", 200, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman ", 200, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 200, 50)
mongols_army = [mongol_archer, mongol_spearman, mongol_swordsman]
jin_allies = [yuna,sensei]
samurai_team = [jin,yuna,sensei]
i = 1

until (jin.isDead? || mongols_army.empty?) do
    
    puts "========= Turn #{i} =========="
    puts "\n"
    samurai_team.each do |samurai|
        samurai_team.delete(samurai) if samurai.isDead? 
    end
    mongols_army.each do |mongol_soldier|
        mongols_army.delete(mongol_soldier) if mongol_soldier.isDead? || mongol_soldier.flee?
    end   
    samurai_team.each do |samurai|
        puts samurai.to_s if samurai.isDead? == false 
    end
    mongols_army.each do |mongol_soldier|
        puts mongol_soldier.to_s if mongol_soldier.isDead? == false 
    end

    jin_action = jin.player_move
    if jin_action == 1
        jin_target =  jin.choose_target()
        jin_target -= 1
        jin.attack(mongols_army[jin_target]) 
        jin_allies.each do |ally|
            ally.attack(mongols_army[rand(mongols_army.size)])
    end
     
    elsif jin_action == 2
        heal_target = jin.heal_target(samurai_team)
        if samurai_team[heal_target].isDead?
            puts "I'm sorry, your friend already dead"
        else
             jin.heal(samurai_team,heal_target) 
        end
        jin_allies.each do |ally|
            ally.attack(mongols_army[rand(mongols_army.size)])
        end
    else
        puts "command not valid"
    end


    mongols_army.each do |mongol_soldier|
        mongol_soldier.attack(samurai_team[rand(samurai_team.size)])
    end
    puts "\n"
    i += 1
    
end
