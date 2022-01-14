# frozen_string_literal: true

# Passage Pathing
class Day12
  def initialize(file)
    lines = File.readlines(file).map(&:strip)
    @connected = Hash.new { |h, k| h[k] = [] }

    lines.each do |line|
      from, to = line.split('-')
      if from == 'start' || to == 'end'
        @connected[from] << to
      elsif to == 'start' || from == 'end'
        @connected[to] << from
      else
        @connected[from] << to
        @connected[to] << from
      end
    end
  end

  def solve(part)
    to_visit = [['start']]
    paths = []

    until to_visit.empty?
      path = to_visit.shift

      @connected[path.last].each do |cave|
        case part
        when 1
          next if cave.downcase == cave && path.include?(cave)

          paths << path + ['end'] if cave == 'end'
          to_visit << path + [cave]
        when 2
          next if cave.downcase == cave && path.include?(cave) && path.include?('twice')

          paths << path + ['end'] if cave == 'end'
          to_visit << if cave.downcase == cave && path.include?(cave)
                        path + ['twice', cave]
                      else
                        path + [cave]
                      end
        end
      end
    end
    paths.size
  end
end

# Part one

part_1 = Day12.new('day_12.txt').solve(1)

puts "Part one answer: #{part_1}"

# Part two

part_2 = Day12.new('day_12.txt').solve(2)

puts "Part two answer: #{part_2}"
