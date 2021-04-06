# Part one

data = []

File.readlines("data_11.txt").each do |line|
  data << line.strip
end

data = data.map {|char| char.chars } 

def adjacent_seats(x, y, data)
  adjacent = [x - 1, x, x + 1].product([y - 1, y, y + 1])
  adjacent = adjacent.reject { |x_1, y_1| x_1 == x && y_1 == y }
  adjacent.select { |x_1, y_1| (0..data.size - 1).cover?(y_1) && (0..data[0].size - 1).cover?(x_1) }
end

while true
  final_data = data.map { |data| data.clone }

  data.each_with_index do |row, y|
    row.each_with_index do |column, x|
      occupied = adjacent_seats(x, y, data).count { |x, y| data[y][x] == "#" }

      if column == "L"
        if occupied == 0
          final_data[y][x] = "#"
        end
      elsif column == "#"  
        if occupied >= 4
          final_data[y][x] = "L"
        end
      end
    end
  end

  if final_data == data
    seats = final_data.flatten.tally 
    occupied_seats = seats["#"]
    puts "Part one answer: #{ occupied_seats }" 
    break
  end
  data = final_data.map { |data| data.clone }
end