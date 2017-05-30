=begin

for each 
=end


def each_cons(array, step)
  count = 0
  array.each_with_index do |element, idx|
    break if element == array.last
    yield(element, array[idx + 1])
  end
end