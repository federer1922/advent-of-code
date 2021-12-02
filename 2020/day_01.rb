# Part one

data = []
File.readlines('day_01.txt').each do |line|
data << line.strip.to_i
end

state = nil

data.each do |first_number|
  break if state == "found"
  data.each do |second_number|
    if first_number + second_number == 2020
      [first_number, second_number]
      puts "Part one answer: #{ first_number * second_number }"
      state = "found"
      break
    end
  end
end

# Part two

data.each do |first_number|
  break if state == "found_3"
  data.each do |second_number|
    break if state == "found_3"
    data.each do |third_number|
      if first_number + second_number + third_number == 2020
        [first_number, second_number, third_number]
        puts "Part two answer: #{first_number * second_number * third_number}"
        state = "found_3"
        break
      end
    end
  end
end




