# frozen_string_literal: true

# Elves Look, Elves Say
class Day10
  def solve(number)
    digits = input_digits
    number.times do
      sequences = look_and_say(digits)
      digits = sequences.flatten
    end
    digits.length
  end

  private

  def input_digits
    input = File.read('day_10.txt')
    input.chars.map(&:to_i)
  end

  def look_and_say(digits)
    sequences = digits.slice_when { _1 != _2 }.to_a
    sequences.map! { |sequence| [sequence.length, sequence[0]] }
  end
end

part1 = Day10.new.solve(40)
puts "Part one answer: #{part1}"

part2 = Day10.new.solve(50)
puts "Part two answer: #{part2}"
