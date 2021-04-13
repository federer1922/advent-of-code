# Part one

data = []

File.readlines("data_24.txt").each do |line| 
  data << line.scan(/e|se|sw|w|nw|ne/)
end

flipped = {}
flipped.default = 0

data.each do |tile| 
  x, y = 0, 0
  tile.each do |direction|
    if direction == "e"
      x += 1
    elsif direction == "w"
      x -= 1
    elsif direction == "se"
      y -= 1
    elsif direction == "sw"
      x -= 1
      y -= 1
    elsif direction == "ne"
      x += 1
      y += 1
    else direction == "nw"
      y += 1
    end
  end
  flipped[[x,y]] += 1
end

flipped.each do |key, value|
  if value.even?
    flipped[key] = "white"
  else
    flipped[key] = "black"
  end
end

puts "Part one answer: #{ flipped.values.count("black") }"