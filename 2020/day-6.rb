# Part one

data = File.read('data_6.txt')

groups = data.split("\n\n")

group_counts = []

groups.each do |group|
  letters_uniq = group.tr("\n", "").chars.uniq
  group_counts << letters_uniq.count
end

sum_of_counts = group_counts.reduce(:+)

puts "Part one answer: #{ sum_of_counts }"

# Part two

sum_everyone_yes = 0

groups.map do |group|
  letters_uniq = group.tr("\n", "").chars.uniq
  letters_uniq
  letters_uniq.count do |char|
    if group.split("\n").all? { |person| person.include?(char) }
      sum_everyone_yes = sum_everyone_yes + 1
    end
  end
end

puts "Part two answer: #{ sum_everyone_yes }"

