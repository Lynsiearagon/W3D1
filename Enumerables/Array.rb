class Array

    def my_flatten
        array = []

        return [] if self.empty?

        self.each do |ele|
            if ele.kind_of?(Array)
                array.concat(ele.my_flatten)
            else
                array << ele
            end
        end

       array

    end

    p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

    

end