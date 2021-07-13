# Session 3 09/07/2021
# Talked about composition
# Composition is a way to combine simple object or data types into more complex objects
require_relative "Player"
require_relative "Samurai"
require_relative "Mongol_archer"
require_relative "Mongol_spearman"
require_relative "Mongol_swordsman"

jin = Player.new("Jin Sakai", 100, 50)
yuna = Samurai.new("Yuna", 90, 45)
sensei = Samurai.new("Sensei Ishikawa", 80, 60)
mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman ", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)
# mongol_archer = Mongol.new("Mongol Archer", 80, 40, MongolArcher)
# mongol_spearman = Mongol.new("Mongol Spearman ", 120, 60, MongolSpearman)
# mongol_swordsman = Mongol.new("Mongol Swordsman", 100, 50, MongolSwordsman)

jin_allies = [yuna,sensei]
samurai_team = [jin] + jin_allies
mongols_army = [mongol_archer, mongol_spearman, mongol_swordsman]

i = 1

until (jin.die? || mongols_army.empty?) do
    
    puts "========= Turn #{i} =========="
    puts "\n"

    # Samurai Description
    samurai_team.each do |samurai|
        puts samurai.to_s
    end
    mongols_army.each do |mongol_soldier|
        puts mongol_soldier.to_s
    end
    puts "\n"

    # Game Menu
    jin_action = jin.player_move
    if jin_action == 1
        jin_target =  jin.choose_target(mongols_army)
        jin.attack(mongols_army[jin_target]) 
        mongols_army.each do |mongol_soldier|
            mongols_army.delete(mongol_soldier) if mongol_soldier.die? || mongol_soldier.flee?   
        end
    elsif jin_action == 2
        heal_target = jin.heal_target(samurai_team)
        jin.heal(samurai_team,heal_target) 
    else
        puts "command not valid"
    end

    # Samurai attack mongol and delete mongol if mongol die or flee
    jin_allies.each do |ally|
        ally.attack(mongols_army[rand(mongols_army.size)]) if !mongols_army.empty?
        mongols_army.each do |mongol_soldier|
            mongols_army.delete(mongol_soldier) if mongol_soldier.die? || mongol_soldier.flee?
        end
    end

    # Villain attack mongol and delete samurai if samurai die 
    mongols_army.each do |mongol_soldier|
        mongol_soldier.attack(samurai_team[rand(samurai_team.size)])
        samurai_team.each do |samurai|
            if samurai.die?
                samurai_team.delete(samurai)
                jin_allies.delete(samurai)
            end
        end
    end

    puts "\n"
    i += 1
end
