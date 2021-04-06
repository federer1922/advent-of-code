data = []

File.readlines("data_12.txt").each do |line|
  data << line.strip
end


x, y = 0, 0
facing = [1, 0]

def turn(direction, degrees)
  turns = degrees / 90
  directions = [[0, 1], [-1, 0], [0, -1], [1, 0]]
  index = directions.index(direction) + turns
  directions[index % 4]
end

data.each do |line|
  action, value = line.match(/(\w?)(\d+)/).captures
  value = value.to_i

  if action == "E"
    x += value
  elsif action == "W"
    x -= value
  elsif action == "N"
    y -= value
  elsif action == "S"
    y += value
  elsif action == "L"
    facing = turn(facing, - value)
  elsif action == "R"
    facing = turn(facing, + value)
  elsif action == "F"
    x += value * facing[0]
    y += value * facing[1]
  end
end

puts "Part one answer: #{ x.abs + y.abs }" 