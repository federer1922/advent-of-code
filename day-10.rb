data = []

File.readlines("data_10.txt").each do |line|
  data << line.strip.to_i
end

data = data.sort
data.unshift(0)
data << data.last + 3

differences_1 = []
differences_3 = []

data.each_cons(2) do |first_number, second_number|
  difference = second_number - first_number
  if difference == 1
    differences_1 << [first_number, second_number]
  elsif difference == 3
    differences_3 << [first_number, second_number]
  end
end

puts "Part one answer: #{ differences_1.length * differences_3.length }"
 


