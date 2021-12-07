# Part one

lines = []
File.readlines('day_05.txt').each do |line|
  lines << line.strip
end
x, y = [], []
x_size = 0
y_size = 0

def get_grid(lines)
  x, y = [], []
  lines.each do |line|
    coordinates_1, coordinates_2 = line.split(" -> ")
    x_1, y_1 = coordinates_1.split(",").map(&:to_i)
    x_2, y_2 = coordinates_2.split(",").map(&:to_i)

    x.push(x_1, x_2)
    y.push(y_1, y_2)
  end
  x_size = (0..x.max).size
  y_size = (0..y.max).size
  grid = Array.new(y_size) { Array.new(x_size, 0) }
end

def dangerous_areas(grid, lines, diagonal = false)
  lines.each do |line|
    coordinates_1, coordinates_2 = line.split(" -> ")
    x_1, y_1 = coordinates_1.split(",").map(&:to_i)
    x_2, y_2 = coordinates_2.split(",").map(&:to_i)
    if x_1 == x_2
      if y_2 > y_1
        (y_1..y_2).each { |y| grid[y][x_1] += 1 }
      else
        (y_2..y_1).each { |y| grid[y][x_1] += 1 }
      end
    elsif y_1 == y_2
      if x_2 > x_1
        (x_1..x_2).each { |x| grid[y_1][x] += 1 }
      else
        (x_2..x_1).each { |x| grid[y_1][x] += 1 }
      end
    # Part two
    elsif diagonal 
      max = (x_1 - x_2).abs
      if x_1 < x_2 && y_1 < y_2
        (0..max).each { |i| grid[y_1 + i][x_1 + i] += 1  }
      elsif
        x_1 < x_2 && y_1 > y_2
        (0..max).each { |i| grid[y_1 - i][x_1 + i] += 1  }
      elsif
        x_1 > x_2 && y_1 < y_2
        (0..max).each { |i| grid[y_1 + i][x_1 - i] += 1  }
      else
        x_1 > x_2 && y_1 > y_2
        (0..max).each { |i| grid[y_1 - i][x_1 - i] += 1  }
      end
    end
  end
  grid.flatten.count { _1 >= 2 }
end

puts "Part one answer: #{ dangerous_areas(get_grid(lines), lines) }"
puts "Part two answer: #{ dangerous_areas(get_grid(lines), lines, diagonal = true) }"

