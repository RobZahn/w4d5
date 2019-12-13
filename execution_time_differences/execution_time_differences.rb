require "byebug"

def my_min(array)
    #prc ||= Proc.new{|a,b| a<=>b}
    
    sorted = false

    until sorted #while sorted == false
        sorted = true
        (0...array.length - 1).each do |i|
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
        end
    end
    array.first
end

# p my_min([9,5,3,7,5,3])


#====================================

#[ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min2(array)     #O(n) 
    min = array.first

    array.each do |ele|
        if min > ele
            min = ele
        end
    end
    min
end

# p my_min2([0, 3, 5, 4, -5, 10, 1, 90 ])
# puts
# p my_min2([9,5,3,7,5,3])

#====================================

def largest_contiguous_subsum(array)                             #O(n)
    new_array = []  
    max = 0
    subsum = 0

    # array.each do |ele|                                         
    #     new_array << [ele]
    # end

    #Write a function that iterates through the array and finds all sub-arrays using nested loops. 

    (0...array.length).each do |start_index|                 #n
        (start_index...array.length).each do |end_index|     #n
            
            temp_sub = array[start_index..end_index]
            subsum = temp_sub.sum
            if subsum > max
                max = subsum
            end
        end                     
    end
    max
end

#p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])

#[2, 5, -1, 6, 0, 7, 3, -3, 4, -2, 5, -6, 1, -5, 2, 7, 1, 8, -6, 1, 7]

# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7



# ([[2], [3], [-6], [7], [-6], [7]])

def largest_contiguous_subsum2(array)
    max = array.first
    current_sum = array.first 

    (1...array.length).each do |i|
        if array[i] < 0 && (current_sum + array[i] < 0)
            current_sum = 0
        else
            current_sum += array[i] #1
            if current_sum > max
                max = current_sum #
            end
        end
    end
    max
end

p largest_contiguous_subsum2([2, 3, -6, 7, -6, 7])
p largest_contiguous_subsum([5, -9, 3, 12, 4])

#current_sum = 0
#max = 5


#array[i] = 7
#max = 7
#


