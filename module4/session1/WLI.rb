
class WLI
    attr_accessor :names

    def initialize
        @names = []
    end

    def likes
        case @names.length
        when 0
            return "no one likes this"
        when 1
            return "#{@names[0]} likes this"
        when 2
            return "#{@names[0]} and #{@names[1]} likes this"
        when 3
            return "#{@names[0]}, #{@names[1]} and one other like this"
        when 4
            return "#{@names[0]}, #{@names[1]} and two others like this"
        else
            return "more than 4 likes this"
        end
    end
end