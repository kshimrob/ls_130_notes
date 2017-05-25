def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def new_compute(number)
  return 'Does not compute.' unless block_given?
  yield(number)
end

p new_compute(5) { |num| num * 5 }
p new_compute(10) {|num| (num * 10).to_s}
p new_compute(12.0) {|num| num % 5}