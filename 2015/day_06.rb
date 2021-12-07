# Part one

instructions = []
File.readlines("day_06.txt").each do |line|
  instructions << line.strip
end

grid = Array.new(1000) { Array.new(1000, false) }


instructions.each do |instruction|
  command, range_1, range_2 = instruction.match(/(\D+) (\d+,\d+)\D+(\d+,\d+)/).captures

  x_1, y_1 = range_1.split(",").map(&:to_i)
  x_2, y_2 = range_2.split(",").map(&:to_i)

  (x_1..x_2).each do |x|
    (y_1..y_2).each do |y|
      if command == "turn on"
        grid[y][x] = true
      elsif command == "turn off"
        grid[y][x] = false
      else
        if grid[y][x] == false
          grid[y][x] = true
        else
          grid[y][x] = false
        end
      end
    end
  end
end

puts "Part one answer: #{ grid.flatten.count(true) }"

# Part two

grid = Array.new(1000) { Array.new(1000, 0) }

instructions.each do |instruction|
  command, range_1, range_2 = instruction.match(/(\D+) (\d+,\d+)\D+(\d+,\d+)/).captures
  
  x_1, y_1 = range_1.split(",").map(&:to_i)
  x_2, y_2 = range_2.split(",").map(&:to_i)
  
  (x_1..x_2).each do |x|
    (y_1..y_2).each do |y|
      if command == "turn on"
        grid[y][x] += 1
      elsif command == "turn off"
        if grid[y][x] > 0
          grid[y][x] -= 1
        end
      else
        grid[y][x] += 2
      end
    end
  end
end

puts "Part two answer: #{ grid.flatten.sum }"