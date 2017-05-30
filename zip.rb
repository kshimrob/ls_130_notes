def zip(array1, array2)
  final_array = []
  count = 0

  while count < array1.size
    final_array << [array1[count], array2[count]]
    count += 1
  end
  final_array
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end