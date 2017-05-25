=begin

INPUT: sorted array
OUTPUT: an array with integers (in order) that should are "missing"
between smallest and largest numbers in array argument

1. define min and max
1. empty array created
2. iterate through and count
3. if number exists, next
4. else push number (iterator) to result_array
5. return array

1. get the range from min to max number
2. delete

=end

# def missing(array)
#   count = array.first
#   missing_numbers = []

#   while count < array.last
#     missing_numbers << count if !array.include?(count)
#     count += 1
#   end
#   missing_numbers
# end

def missing(array)
  full_array = (array.first..array.last).to_a
  full_array - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
