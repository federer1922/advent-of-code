class Day12
  def initialize(file)
    lines = File.readlines(file).map(&:strip)
    @connected = Hash.new { |h, k| h[k] = [] }

    lines.each do |line|
      from, to = line.split("-")
      if from == "start" || to == "end"
        @connected[from] << to
      elsif to == "start" || from == "end"
        @connected[to] << from
      else
        @connected[from] << to
        @connected[to] << from
      end
    end
    @connected
  end

  def solve(part_1 = true)
    to_visit = [["start"]]
    paths = []

    until to_visit.empty?
      path = to_visit.shift

      @connected[path.last].each do |cave|
        if part_1
          next if cave.downcase == cave && path.include?(cave)
        else # Part two
          small_caves = path.select { _1.downcase == _1 }
          next if small_caves.size - small_caves.uniq.size > 1
        end

        if cave == "end"
          paths << path + ["end"]
        end

        to_visit << path + [cave]
      end
    end
    paths.size
  end
end

# Part one

part_1 = Day12.new('day_12.txt').solve

puts "Part one answer: #{ part_1 }"


# Part two

part_2 = Day12.new('day_12.txt').solve(false)

puts "Part two answer: #{ part_2 }"
