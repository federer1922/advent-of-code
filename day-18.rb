# Part one

data = []

File.readlines('data_18.txt').each do |line|
  data << line.strip.tr("*", "-")
end

class Integer
  def -(number)
    self * (number)
  end
end

results = []

data.each do |equation|
  results << eval(equation)    
end

puts "Part one answer: #{ results.reduce(:+) }"
