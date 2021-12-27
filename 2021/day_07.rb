# Part one

positions = File.read('day_07.txt').split(",").map(&:to_i)

def min_fuel(input, part_two = false)
  align = {}
  (input.min..input.max).each do |from|
    fuel = 0
    input.each do |to|
      unless part_two
        fuel += (from - to).abs
      else
        fuel += (1..(from - to).abs).sum # Part two
      end
    end
    align[from] = fuel
  end
  min_fuel = align.values.min
end

part_one = min_fuel(positions)
puts "Part one answer: #{ part_one }"

# Part two

part_two = min_fuel(positions, true)
puts "Part two answer: #{ part_two }"