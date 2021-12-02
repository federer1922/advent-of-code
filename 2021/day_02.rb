# Part one

commands = []
File.readlines("day_02.txt").each do |line|
  commands << line.strip
end
x, y = 0, 0

commands.each do |command|
  direction, value = command.split(" ")
  units = value.to_i

  case direction
  when "forward"
    x += units
  when "down"
    y += units
  when "up"
    y -= units
  end
end

puts "Part one answer: #{ x * y }"

# Part two

aim, x, y = 0, 0, 0

commands.each do |command|
  direction, value = command.split(" ")
  units = value.to_i

  case direction
  when "forward"
    x += units
    y += aim * units
  when "down"
    aim += units
  when "up"
    aim -= units
  end
end

puts "Part two answer: #{ x * y }"
