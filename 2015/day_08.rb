# frozen_string_literal: true

# Matchsticks
class Day08
  def solve_1
    literals_sum - strings_sum
  end

  def solve_2
    (literals_sum - total_sum).abs
  end

  private

  def literals_sum
    @literals = File.readlines('day_08.txt')
                    .map(&:chomp)
                    .map { |line| line.delete(' ') }

    @literals_sum = @literals.map(&:length).sum
  end

  def strings_sum
    strings = @literals.map { |literal| eval(literal) }
    @strings_sum = strings.map(&:length).sum
  end

  def total_sum
    totals = @literals.map(&:inspect)
    @totals_sum = totals.map(&:length).sum
  end
end

part_1 = Day08.new.solve_1
puts "Part one answer: #{part_1}"

part_2 = Day08.new.solve_2
puts "Part two answer: #{part_2}"
