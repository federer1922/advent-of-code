data = []

File.readlines("data_14.txt").each do |line|
    data << line.strip
end

mask = nil

memory = {}

data.each do |line|
  if line.include?("mask")
    mask = line.split("= ").last
  else
    memory_address, value = line.match(/\w+\[(\d+)\] = (\d+)/).captures
    
    value = value.to_i
    value = value.to_s(2)

    overwriting = mask.chars.reverse.zip(value.reverse.chars).map do |mask, value|
      if mask != "X"
        mask
      else
        value || 0
      end
    end

    memory[memory_address.to_i] = overwriting.reverse.join.to_i(2)
  end
end

puts "Part one answer: #{memory.values.reduce(:+)}" 



