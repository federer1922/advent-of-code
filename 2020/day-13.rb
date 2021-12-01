# Part one

data = []

File.readlines("data_13.txt").each do |line|
    data << line.strip
end

earliest_depart = data.first.to_i

buses = data[1].split(",")
buses.delete("x")
buses = buses.map(&:to_i)

earliest_buses = {}


buses.each do |bus|
  
  bus_times = 0
  while earliest_depart >= bus_times
    bus_times += bus
    if earliest_depart <= bus_times
      earliest_buses[bus] = bus_times - earliest_depart
    end
  end
end

earliest_bus = earliest_buses.select { |k, v| v == earliest_buses.values.min }.to_a.flatten

puts "Part one answer: #{ earliest_bus.reduce(:*) }" 