# Part one

data = []

File.readlines("day_09.txt").each do |line|
  data << line.strip.to_i
end

min, max = 0, 24
invalid_number = nil
loop do
  preamble = data[min..max]
  if preamble.uniq.combination(2).find { |first_number, second_number| first_number + second_number == data[max +1] }
    min = min + 1
    max = max +1
  else
    invalid_number = data[max + 1]
    break
  end
end
puts "Part one answer: #{ invalid_number }"

# Part two

data.size.times do |min_range|
  max_range = min_range + 1
  range_sum = 0
  while range_sum < invalid_number
    range = data[min_range..max_range]
    range_sum = range.reduce(:+)

    if range_sum == invalid_number
      puts "Part two answer: #{ range.minmax.reduce(:+) }"
      return
    end
    max_range = max_range + 1
  end
end


