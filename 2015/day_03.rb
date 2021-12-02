require 'set'

# Part one

directions = File.read('day_03.txt').chars

houses_coordinates = Set.new
x = 0
y = 0
houses_coordinates << [x, y]

directions.each do |direction|
  if direction == '^'
    y += 1
  elsif direction == 'v'
    y -= 1
  elsif direction == '>'
    x += 1
  else
    x -= 1
  end
  houses_coordinates << [x, y]
end

puts "Part one answer: #{ houses_coordinates.size }"

# Part two

houses_coordinates = Set.new
x = 0
y = 0
houses_coordinates << [x, y]
santa_directions = []
robot_directions = []
robot_x = 0
robot_y = 0

directions.each_with_index do |direction, index|
  if index.even?
    santa_directions << direction
  else
    robot_directions << direction
  end
end

santa_directions.each do |direction|
  if direction == '^'
    y += 1
  elsif direction == 'v'
    y -= 1
  elsif direction == '>'
    x += 1
  else
    x -= 1
  end
  houses_coordinates << [x, y]
end

robot_directions.each do |direction|
  if direction == '^'
    robot_y += 1
  elsif direction == 'v'
    robot_y -= 1
  elsif direction == '>'
    robot_x += 1
  else
    robot_x -= 1
  end
  houses_coordinates << [robot_x, robot_y]
end
  
puts "Part two answer: #{ houses_coordinates.size }"