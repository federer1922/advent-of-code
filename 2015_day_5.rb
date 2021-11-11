# Part one

strings = []
File.readlines("2015_day_5.txt").each do |line|
  strings << line.strip
end

nice_strings = []

strings.each do |string|
  if string.count("aeiou") >= 3
    if string.scan(/((\D)\2)/).size > 0
      naughty_letters = %w(ab cd pq xy)
      naughty_count = 0

      naughty_letters.each do |letters|
        naughty_count += string.scan(/#{letters}/).size
      end
      if naughty_count == 0
        nice_strings << string
      end
    end
  end
end

puts "Part one answer: #{ nice_strings.size }"

# Part two

nice_strings = []

strings.each do |string|
  pairs = []
  string.chars.each_cons(2) { |a| pairs << a.join }
  
  pairs.each_cons(2) do |a, b|
    if a == b
      pairs.delete_at(pairs.index(a))
    end
  end
  if pairs.size > pairs.uniq.size
    if string.chars.each_cons(3).any? { |a, b, c| a == c }
      nice_strings << string
    end
  end
end

puts "Part two answer: #{ nice_strings.size }"
