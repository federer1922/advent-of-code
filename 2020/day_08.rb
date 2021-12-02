# Part one

require "set"

data = []
File.readlines("day_08.txt").each do |line|
  data << line.strip
end

lines_executed = Set.new
jump = 0 
accumulator = 0

while true
  if lines_executed.include?(jump)
    puts "Part one answer: #{ accumulator }"
    exit
  end

  lines_executed << jump

  operation, argument = data[jump].split
  argument = argument.to_i

  if operation == "acc"
    accumulator = accumulator + argument
  elsif operation == "jmp"
    jump = jump + argument -1
  end
  
  jump = jump + 1
end

