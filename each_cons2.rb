# =begin
# 1. takes an argument that specifies how many elements that should be processed at a time

# =end


# def each_cons(array, step)
#   # count = 0
#   if step <= 2
#     array.each_with_index do |element, idx|
#       break if array[idx + (step - 1)].nil?
#       yield(element, array[idx + (step - 1)])
#       # count += step - 1
#     end
#   else
#     loop do 


#     end
#   end


# end

def each_cons(array, step)
  count = 0
  blocks = []
  while count < array.size
    block = []
    count.upto(count + step) do |num|
      block << array[num]
    end
    blocks << block
    count += 1
  end

  array.each_with_index do |element, idx|
    yield(element, blocks[idx])
  end
end

def each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
end

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == { 1 => 3, 3 => 6, 6 => 10 } 

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6], 3 => [6, 10] }


  # count = 0
  # array.each_with_index do |element, idx|
  #   break if element == array.last
  #   yield(element, array[idx + 1])
  # end