# Part one

instructions = []
File.readlines("2015_day_6.txt").each do |line|
  instructions << line.strip
end

grid = Array.new(1000) { Array.new(1000, false) }


instructions.each do |instruction|
  command, range_1, range_2 = instruction.scan(/(\D+) (\d+,\d+)\D+(\d+,\d+)/).flatten

  x_1, y_1 = range_1.split(",").map(&:to_i)
  x_2, y_2 = range_2.split(",").map(&:to_i)

  (x_1..x_2).each do |x|
    (y_1..y_2).each do |y|
      if command == "turn on"
        grid[x][y] = true
      elsif command == "turn off"
        grid[x][y] = false
      else
        if grid[x][y] == false
          grid[x][y] = true
        else
          grid[x][y] = false
        end
      end
    end
  end
end

puts "Part one answer: #{ grid.flatten.count(true) }"

# Part two

grid = Array.new(1000) { Array.new(1000, 0) }

instructions.each do |instruction|
  command, range_1, range_2 = instruction.scan(/(\D+) (\d+,\d+)\D+(\d+,\d+)/).flatten
  
  x_1, y_1 = range_1.split(",").map(&:to_i)
  x_2, y_2 = range_2.split(",").map(&:to_i)
  
  (x_1..x_2).each do |x|
    (y_1..y_2).each do |y|
      if command == "turn on"
        grid[x][y] += 1
      elsif command == "turn off"
        if grid[x][y] > 0
          grid[x][y] -= 1
        end
      else
        grid[x][y] += 2
      end
    end
  end
end

puts "Part two answer: #{ grid.flatten.sum }"