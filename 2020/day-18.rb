# Part one

data = []

File.readlines('data_18.txt').each do |line|
  data << line.strip.tr("*", "-")
end

class Integer
  def - (number)
    self * (number)
  end
  def ** (number)
    self + (number)
  end
end

results = []

data.each do |equation|
  results << eval(equation)    
end

puts "Part one answer: #{ results.reduce(:+) }"

# Part two

data = data.map { |line| line.gsub("+", "**") }
data = data.map { |line| line.tr("-", "*") }

results_2 = []

data.each do |equation|
  results_2 << eval(equation)    
end

puts "Part two answer: #{ results_2.reduce(:+) }"