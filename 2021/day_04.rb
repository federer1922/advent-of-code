# Part one

data = File.read('day_04.txt').split("\n\n")
numbers = data.delete_at(0).split(',').map(&:to_i)
boards = data.map do |board| 
  board = board.split("\n")
  board.map { |x| x.split(" ").map(&:to_i) }
end
status = 0
unmarked_sum = 0
called_number = 0

numbers.each do |number|
  boards.each do |board|
    board.each do |row|
      row.map! { |x|  x == number ? true : x }
    end
  end
  boards.each do |board| 
    board.each do |row|
      if row.count(true) == 5
        status = "bingo"
        unmarked_sum = board.flatten.grep(Integer).sum
        called_number = number
      end
    end
    board.transpose.each do |column|
      if column.count(true) == 5
        status = "bingo"
        unmarked_sum = board.flatten.grep(Integer).sum
        called_number = number
      end
    end
  end
  break if status == "bingo"
end

final_score = unmarked_sum * called_number

puts "Part one answer: #{ final_score }"

# Part two

boards = data.map do |board| 
  board = board.split("\n")
  board.map { |x| x.split(" ").map(&:to_i) }
end
status = 0
unmarked_sum = 0
called_number = 0

numbers.each do |number|
  boards.each do |board|
    board.each do |row|
      row.map! { |x|  x == number ? true : x }
    end
  end
  boards.each_with_index do |board, idx| 
    board.each do |row|
      if row.count(true) == 5 && boards.size == 1
        status = "bingo"
        unmarked_sum = board.flatten.grep(Integer).sum
        called_number = number
      elsif row.count(true) == 5
        boards.delete_at(idx)
      end
    end
    board.transpose.each do |column|
      if column.count(true) == 5 && boards.size == 1
        status = "bingo"
        unmarked_sum = board.flatten.grep(Integer).sum
        called_number = number
      elsif column.count(true) == 5
        boards.delete_at(idx)
      end
    end
  end
  break if status == "bingo"
end

final_score = unmarked_sum * called_number

puts "Part two answer: #{ final_score }"