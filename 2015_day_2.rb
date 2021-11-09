# Part one

presents = []
File.readlines("2015_day_2.txt").each do |line|
  presents << line.strip
end

wrapping_paper = 0

presents.each do |present|
  length, width, height = present.split("x").map(&:to_i)

  surface_area = [2* length * width, 2 * width * height, 2 * height * length]
  extra_paper = surface_area.min / 2

  wrapping_paper += surface_area.sum + extra_paper
end

puts "Part one answer: #{ wrapping_paper }"

# Part two

ribbon = 0 

presents.each do |present|
  dimensions = present.split("x").map(&:to_i).sort
  short_sides = dimensions.take(2)

  wrap_ribbon = short_sides.sum * 2
  bow_ribbon = dimensions.reduce(:*)

  ribbon += wrap_ribbon + bow_ribbon
end

puts "Part two answer: #{ ribbon }"