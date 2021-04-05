# Part one

data = []

File.readlines("data_9.txt").each do |line|
  data << line.strip.to_i
end

min, max = 0, 24

loop do
  preamble = data[min..max]
  if preamble.uniq.combination(2).find { |first_number, second_number| first_number + second_number == data[max +1] }
    min = min + 1
    max = max +1
  else
    puts "Part one answer: #{ data[max +1] }"
    break
  end
end

