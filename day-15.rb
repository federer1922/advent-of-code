# Part one

data = []

File.readlines("data_15.txt").each do |line|
    data = line.split(",").map(&:to_i)
end

numbers_spoken = Hash.new { |h, k| h[k] = [] }

data.each.with_index do |number, index|
  numbers_spoken[number] << index
end

index = data.count
last_number = data.last

while true
  if numbers_spoken[last_number].count > 1
    last_number = numbers_spoken[last_number].last(2).reverse.reduce(:-)
  else
    last_number = 0
  end

  numbers_spoken[last_number] << index
  index += 1

  if index == 2020
    puts "Part on answer: #{ last_number }"
    break
  end 
end
