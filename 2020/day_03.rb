# Part one

data = File.read('day_03.txt').split("\n").map do |line|
    line.split('')
end

x, y, trees = 0, 0, 0
x_right = 3
y_down = 1

while y < data.length - 1
  x = x + x_right  
  x %= data.first.length
  y = y + y_down

  trees = trees + 1 if data[y][x] == '#'
end

puts "Part one answer: #{ trees }"

# Part two

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

slope_trees = []

slopes.each do |x_right, y_down|
  x = 0
  y = 0
  trees = 0

  while y < data.length - 1
    x = x + x_right
    x %= data.first.length
    y = y + y_down

    trees += 1 if data[y][x] == '#'
  end
  slope_trees << trees
end

puts "Part two answer: #{ slope_trees.reduce(:*) }" 

