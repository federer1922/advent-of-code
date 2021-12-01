# Part one

data = File.read("data_23.txt")

cups = data.chars.map(&:to_i)
index = 0

100.times do |move|
  current = cups[index]
  picked_up = []
  3.times do
    if index + 1 >= cups.size
      picked_up << cups.shift
    else
      picked_up << cups.slice!(index + 1)
    end
  end
  destination = cups.select { |destination| current > destination }.max
  if destination.nil?
    destination = cups.max
  end 
  cups.insert(cups.index(destination) + 1, *picked_up)
  index = (cups.index(current) + 1) % cups.size
end

labeled_1 = cups.index(1)

order = []

(1...cups.size).each do |number| 
  order << cups[(labeled_1 + number) % cups.size] 
end

puts "Part one answer: #{ order.join("") }" 
