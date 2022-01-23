# frozen_string_literal: true

# All in a Single Night
class Day09
  def solve(part)
    input
    distances
    routes
    part == 1 ? routes_lengths.min : routes_lengths.max
  end

  private

  def input
    @input = File.readlines('day_09.txt').map(&:chomp)
  end

  def distances
    @distances = Hash.new { |hash, key| hash[key] = {} }
    @input.each do |line|
      pair, distance = line.split(' = ')
      from, to = pair.split(' to ')
      @distances[from][to] = distance.to_i
      @distances[to][from] = distance.to_i
    end
  end

  def routes
    locations = @distances.keys
    @routes = locations.permutation.to_a
  end

  def routes_lengths
    routes_lengths = []
    @routes.each do |route|
      length = 0
      route.each_cons(2) do |from, to|
        length += @distances[from][to]
      end
      routes_lengths << length
    end
    routes_lengths
  end
end

part1 = Day09.new.solve(1)
puts "Part one answer: #{part1}"

part2 = Day09.new.solve(2)
puts "Part two answer: #{part2}"
