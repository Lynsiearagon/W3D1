require 'byebug'

class Array

    def my_each(&blk)
        i = 0

        while i < self.length
            blk.call(self[i])
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

    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []
    
    def my_reject(&blk)
        rejected = []


        self.my_each do |ele|
            rejected << ele if !blk.call(ele)
    
        end


        rejected
    end
    
    # a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]

    def my_any?(&blk)
        self.my_each { |ele| return true if blk.call(ele) }
        false
    end

    a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false

    def my_all?(&blk)
        self.my_each { |ele| return false if !blk.call(ele) }
        true
    end


    p a.my_all? { |num| num > 1 } # => false
    p a.my_all? { |num| num < 4 } # => true

    
end
