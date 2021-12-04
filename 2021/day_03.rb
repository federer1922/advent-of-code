# Part one
require 'pry'

rows = []
File.readlines('day_03.txt').each do |line|
  rows << line.strip.chars
end

columns = rows.transpose
gamma_rate = ""
epsilon_rate = ""

columns.each do |column|
  if column.count("0") > column.count("1")
    gamma_rate << "0"
    epsilon_rate << "1"
  else
    gamma_rate << "1"
    epsilon_rate << "0"
  end
end

power_consumption = gamma_rate.to_i(2) * epsilon_rate.to_i(2)

puts "Part one answer: #{ power_consumption }"

number = 0
oxygen_generator = rows.transpose

while oxygen_generator[0].size > 1
  column = oxygen_generator[number]
  if column.count("1") >= column.count("0")
    idxs = column.each_index.select { |x| column[x] == "0" }.reverse
    oxygen_generator.each do |col|
      idxs.each do |idx|
        col.delete_at(idx)
      end
    end
  else
    idxs = column.each_index.select { |x| column[x] == "1" }.reverse
    oxygen_generator.each do |col|
      idxs.each do |idx|
        col.delete_at(idx)
      end
    end
  end
  number += 1
end
oxygen_generator = oxygen_generator.join

number = 0
co2_scrubber = rows.transpose

while co2_scrubber[0].size > 1
  column = co2_scrubber[number]
  if column.count("0") <= column.count("1")
    idxs = column.each_index.select { |x| column[x] == "1" }.reverse
    co2_scrubber.each do |col|
      idxs.each do |idx|
        col.delete_at(idx)
      end
    end
  else
    idxs = column.each_index.select { |x| column[x] == "0" }.reverse
    co2_scrubber.each do |col|
      idxs.each do |idx|
        col.delete_at(idx)
      end
    end
  end
  number += 1
end
co2_scrubber = co2_scrubber.join

life_support = oxygen_generator.to_i(2) * co2_scrubber.to_i(2)

puts "Part two answer: #{ life_support }"