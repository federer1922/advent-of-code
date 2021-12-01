# Part one

data = File.read("data_17.txt")

slices = data.split("\n").map { |chars| chars.split("") }
slices = [slices]

def neighbours(x, y, z, slices)
  neighbours = [-1, 0, 1]

  neighbours = neighbours.product(neighbours, neighbours).reject { |d| d == [0,0,0] }
  neighbours = neighbours.map do |dx, dy, dz| 
    [x + dx, y + dy, z + dz]
  end
  neighbours.select do |x,y,z|
    (0..slices.size - 1).cover?(z) && (0..slices[z].size - 1).cover?(y) && (0..slices[z].size - 1).cover?(x)
  end
end

def row(size)
  Array.new(size, ".")
end

def slice(size)
  Array.new(size) { row(size) }
end

6.times do |cycle|
  size = slices[0].size + 2

  slices.each do |slice|
    slice.each do |row|
      row.unshift(".")
      row << "."
    end
    slice.unshift(row(size))
    slice << row(size)
  end
  slices.unshift(slice(size))
  slices << slice(size)

  new_slices = slices.map { |slice| slice.map(&:clone) }

  slices.each_with_index do |slice, z|
    slice.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        count = neighbours(x, y, z, slices)
        count = count.map { |x1, y1, z1| slices[z1][y1][x1] }
        count = count.count { |count| count == "#" }

        if cell == "#"
          if !(count == 2 || count == 3)
            new_slices[z][y][x] = "."
          end
        elsif count == 3
          new_slices[z][y][x] = "#"
        end
      end
    end
  end
  slices = new_slices
end

puts "Part one answer: #{slices.flatten.count { |count| count == "#" } }"