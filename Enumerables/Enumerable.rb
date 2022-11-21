class Array

    def my_each(&blk)
        i = 0

        while i < self.length
            new_i = blk.call(self[i])
            self[i] = new_i
            i += 1
        end

        self 
    end
    
    # p [1, 2, 3].my_each { |ele| ele + 1 }

    def my_select(&blc)
        arr = []
        
        self.my_each(blc) do |elements|
            arr << elements if blc.call(elements)
        end

        arr
    end

    a = [1, 2, 3]
    p a.my_select { |num| num > 1 } # => [2, 3]
    p a.my_select { |num| num == 4 } # => []
    

    

end
