# Part one
# 0,6,9: 6, 1: 2, 2,3,5: 5, 4: 4, 7: 3, 8: 7

def get_input(file)
  lines = File.readlines(file).map(&:strip)
end

def output_values(input)
  values = []
  input.each do |line| 
    line_values = line.split(" | ")[1]
    values << line_values.split(" ")
  end
  values
end

def count_uniq(output)
  count = 0
  output = output.flatten
  output.each do |segment|
    uniq_segments = [2, 4, 3, 7]
    uniq_chars = segment.chars.size 
    if uniq_segments.include?(uniq_chars)
      count += 1
    end
  end
  count
end

input = get_input('day_08.txt')
values = output_values(input)
count = count_uniq(values)

puts "Part one answer: #{ count }"

# Part two

def sum_outputs(input)
  sum_output = 0
  input.each do |line|
    line_patterns, line_values = line.split(" | ")
    patterns = line_patterns.split(" ").map { _1.chars }
    values = line_values.split(" ").map { _1.chars }

    chars_1 = patterns.select { _1.size == 2 }.flatten.sort
    chars_4 = patterns.select { _1.size == 4 }.flatten.sort
    chars_7 = patterns.select { _1.size == 3 }.flatten.sort
    chars_8 = patterns.select { _1.size == 7 }.flatten.sort
    chars_0 = nil
    chars_2 = nil
    chars_3 = nil
    chars_5 = nil
    chars_6 = nil
    chars_9 = nil

    chars_0_6_9 = patterns.select { _1.size == 6 }
    chars_0_6_9.each do |number|
      if (number - chars_1).size == 5
        chars_6 = number.sort
      elsif (number - chars_4).size == 2
        chars_9 = number.sort
      else
        chars_0 = number.sort
      end
    end

    chars_2_3_5 = patterns.select { _1.size == 5 }
    chars_2_3_5.each do |number|
      if (number - chars_1).size == 3
        chars_3 = number.sort 
      elsif (number - chars_9).empty?
        chars_5 = number.sort
      else
        chars_2 = number.sort
      end
    end

    signals = {}
    signals[chars_0] = 0
    signals[chars_1] = 1
    signals[chars_2] = 2
    signals[chars_3] = 3
    signals[chars_4] = 4
    signals[chars_5] = 5
    signals[chars_6] = 6
    signals[chars_7] = 7
    signals[chars_8] = 8
    signals[chars_9] = 9

    output_value = []

    values.each do |value|
      output_value << signals[value.sort]
    end

    sum_output += output_value.join.to_i
  end
  sum_output
end

sum = sum_outputs(input)

puts "Part two answer: #{ sum }"