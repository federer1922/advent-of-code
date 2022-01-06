# Part one

data = File.read('day_06.txt').split(',').map(&:to_i)

def initial_state(input)
  initial = {}
  initial.default = 0
  input.each { initial[_1] += 1 }
  initial
end

initial_state = initial_state(data)
final = initial_state.dup
final.default = 0

def number_of_fish(initial_state, days)
  final = initial_state.dup
  days.times do
    initial_state.each do |k, v|
      if k > 0 
        final[k] -= v
        final[k - 1] += v 
      elsif k == 0
        final[6] += v
        final[8] += v
        final[0] -= v
      end
    end
    initial_state = final.dup
  end
  final.values.sum
end

initial_state = initial_state(data)

fish_after_80 = number_of_fish(initial_state, 80)
puts "Part one answer: #{ fish_after_80 }"

# Part two

fish_after_256 = number_of_fish(initial_state, 256)
puts "Part two answer: #{ fish_after_256 }"

