def step(min, max, step)
  count = min
  while count <= max
    yield(count)
    count += step
  end
  count
end

step(1, 10, 3) { |value| puts "value = #{value}" }