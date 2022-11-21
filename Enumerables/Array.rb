class Array

    def my_flatten
        array = []

        self.each do |ele|
            if ele == ele.kind_of?(Array)
                array.push(*ele)
            else
                array << ele
            end
        end

        if self.all? { |ele| ele != ele.kind_of?(Array) }
            return array
        else
            self[1..-1].my_flatten
        end

    end

    p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

end