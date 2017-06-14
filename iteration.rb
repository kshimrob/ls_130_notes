factorial = Enumerator.new do |y|
  a = 1
  b = 2
  loop do
    y << a
    a *= b
    b += 1
  end
end

p factorial.take(7)

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end