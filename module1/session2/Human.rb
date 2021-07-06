class Human

    def initialize(name,age,height,weight)
        @name = name
        @age = age
        @height = height
        @weight = weight
    end

    def walk()
        puts "Hi my name is #{@name} and right now im walking"
    end

    def birthday()
        puts "Hi my name is #{@name}, tommorow is my #{@age} birthday"
    end

end