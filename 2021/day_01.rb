# Part one

measurements = File.readlines('day_01.txt').map(&:to_i)
increased = 0
previous_measurement = measurements[0]

measurements.each do |measurement|
  if measurement > previous_measurement
    increased += 1
  end
  previous_measurement = measurement
end

puts "Part one answer: #{ increased }"

# Part two

measuring_trios = []
measurements.each_cons(3) { |trio| measuring_trios << trio.sum }
increased = 0
previous_measurement = measuring_trios[0]

measuring_trios.each do |measurement|
  if measurement > previous_measurement
    increased += 1
  end
  previous_measurement = measurement
end

puts "Part two answer: #{ increased }"