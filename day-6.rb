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