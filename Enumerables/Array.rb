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

    

end

p [1, 2, 3].my_each { |ele| ele + 1 }