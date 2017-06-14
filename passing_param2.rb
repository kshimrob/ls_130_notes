stuff = %w(raven finch hawk eagle)

def group(array)
  yield(array[0], array[1], array[2..-1])
end

first_array = nil
second_array = nil
third_array = nil

group(stuff) do |one, two, three| 
  first_array = one
  second_array = two
  third_array = three
end

p first_array
p second_array
p third_array