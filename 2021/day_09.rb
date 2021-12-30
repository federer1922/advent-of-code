# Part one

def get_numbers(file)
  data = File.readlines(file).map(&:strip)
                             .map { |row| row.split('')
                             .map(&:to_i) }
end

def compare(values, number)
  values.all? { _1 > number }
end


def get_adjacent(numbers, x, y)
  x_max = numbers.size - 1
  y_max = numbers[0].size - 1

  adjacent = [
    [x + 1, y],
    [x - 1, y],
    [x, y + 1],
    [x, y - 1]
  ]

  adjacent.reject! do |x_1, y_1|
    x_1 < 0 || x_1 > x_max ||
    y_1 < 0 || y_1 > y_max
  end
  adjacent
end

def get_low_points(numbers, part_one = true)
  x_max = numbers.size - 1
  y_max = numbers[0].size - 1
  low_points = []

  (0..x_max).each do |x|
    (0..y_max).each do |y|
      values = []
      number = numbers[x][y]

      adjacent = get_adjacent(numbers, x, y)
      adjacent.each do |x_1, y_1|
        values << numbers[x_1][y_1]
      end
      
      if compare(values, number)
        if part_one
          low_points << number
        else
          low_points << [x, y] # Part two
        end
      end
    end
  end
  low_points
end

def get_risk_level(low_points)
  risk_level = low_points.sum + low_points.size
end

numbers = get_numbers('day_09.txt')
low_points = get_low_points(numbers)
risk_level = get_risk_level(low_points)

puts "Part one answer: #{ risk_level }"

# Part two

def get_basin_sizes(numbers, low_points)
  basin_sizes = []

  low_points.each do |point|
    basin = []
    next_points = []
    x, y = point
    basin << [x, y]
    next_points << [x, y]
    until next_points.empty?
      next_point = next_points.shift
      x, y = next_point
      adjacent = get_adjacent(numbers, x, y)
      adjacent.each do |x_1, y_1|
        if numbers[x_1][y_1] < 9 && basin.none?([x_1, y_1])
          basin << [x_1, y_1]
          next_points << [x_1, y_1]
        end
      end
      next_point
    end
    basin_sizes << basin.size
  end
  basin_sizes
end

def top_3(basins)
  basins.max(3).reduce(:*)
end

numbers = get_numbers('day_09.txt')
low_points_2 = get_low_points(numbers, false)
basin_sizes = get_basin_sizes(numbers, low_points_2)
result = top_3(basin_sizes)

puts "Part two answer: #{ result }"