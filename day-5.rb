# Part one

data = []
File.readlines('data_5.txt').each do |line|
data << line.strip
end

seats_id = []

data.each do |seats|

  row_number = nil
  column_number = nil
  row_min = 0
  row_max = 127
  column_min = 0 
  column_max = 7
  seats.split("").each do |seat|
    row = (row_min + row_max) / 2 
    column = (column_min+ column_max) / 2
    
    if seat == "F"
      row_max = row
    elsif seat == "B"
      row_min = row + 1
    elsif seat == "L"
      column_max = column
    elsif seat == "R"
      column_min = column + 1
      
    end    
  end

  row_number = row_max
  column_number = column_max
  
  
  seats_id << row_number * 8 + column_number
  

  
end

puts "Part one answer: #{ seats_id.max }"

# Part two

id = seats_id.find { |id| seats_id.include?(id) && seats_id.include?(id + 2) && !seats_id.include?(id + 1) } + 1

puts "Part two answer: #{ id }"