# Part one

instructions = File.read("2015_day_1.txt").chars
floor = 0

instructions.each do |instruction|
  if instruction == "("
    floor += 1
  else
    floor -= 1
  end
end

puts "Part one answer: #{ floor }"

# Part two

floor = 0
position = 0

instructions.each_with_index do |instruction, index|
  if instruction == "("
    floor += 1
  else
    floor -= 1
  end
  position = index + 1

  break if floor == -1
end

puts "Part two answer: #{ position }"
