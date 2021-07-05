class Samurai 

    def initialize(name,hitpoint,attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def profile()
        puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage " 
    end

    def attack(target)
        target.take_damage(@attack_damage)
        puts "#{@name} attacks #{@target} with #{@attack_damage} damage" 
    end

    def take_damage(damage)
        @hitpoint -= damage
        puts "#{@name} has #{@hitpoint} and #{@attack_damage} attack damage"
    end

    def die()
        puts "#{@name} Dies"
    end
end

# print "insert Player:"
# name = gets.chomp.to_s

# print "Insert hitpoint:"
# hitpoint = gets.chomp.to_i

# print "Insert attack damage:"
# attack_damage = gets.chomp.to_s

# player = Samurai.new(name, hitpoint, attack_damage)

# print "insert Enemy:"
# name2 = gets.chomp.to_s

# print "Insert hitpoint:"
# hitpoint2 = gets.chomp.to_i

# print "Insert attack damage:"
# attack_damage2 = gets.chomp.to_s

# enemy = Samurai.new(name2, hitpoint2, attack_damage2)

# player.profile()
# enemy.profile()

# player.attack(name2)
# enemy.profile()

# enemy.attack(name)
# player.profile()

# player.attack(name2)
# enemy.profile()

# enemy.attack(name)
# player.profile()

# player.die()

