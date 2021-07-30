
class IntegerArrayIncrementer
    def increment(input)
        i = input.length - 1
            while i >=  0  do
                if input[i] == 9 
                    input[i] = 0
                else
                    input[i] += 1
                    return input
                end
                i -= 1
            end
            input[0] = 1
            input << 0
            input
    end
end