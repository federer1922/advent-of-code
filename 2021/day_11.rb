# Part one

class Day11
  def initialize(file)
    @grid = File.readlines(file).map(&:strip)
                                .map { |line| line.split('').map(&:to_i) }
    @x_max = @grid.first.size - 1
    @y_max = @grid.size - 1
    @count = 0
  end

  def add_level
    @grid.each do |line|
      line.map! { |level| level += 1 }
    end 
  end

  def get_adjacent(x, y)
    adjacent = [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1],
      [x - 1, y - 1],
      [x - 1, y + 1],
      [x + 1, y - 1],
      [x + 1, y + 1]
    ]
  
    adjacent.reject! do |x_1, y_1|
      x_1 < 0 || x_1 > @x_max ||
      y_1 < 0 || y_1 > @y_max
    end
    adjacent
  end

  def flashes
    check = [true]
    while check.any?
      (0..@x_max).each do |x|
        (0..@y_max).each do |y|
          if @grid[y][x] > 9
            @grid[y][x] = 0
            @count += 1
            adjacent = get_adjacent(x, y)
            adjacent.each do |x_1, y_1|
              unless @grid[y_1][x_1] == 0
                @grid[y_1][x_1] += 1
              end
            end
          end
        end
      end
      check = []
      @grid.each do |line|
        check << line.any? { _1 > 9 }
      end
    end
  end

  def part_1
    100.times do
    add_level
    flashes
    end
    @count
  end

  # Part two

  def count_flashes
    count = 0
    (0..@x_max).each do |x|
      (0..@y_max).each do |y|
        if @grid[y][x] == 0
          count += 1
        end
      end
    end
    count
  end

  def part_2
    step = 0
    until count_flashes == 100
      add_level
      flashes
      count_flashes
      step += 1
    end
    step
  end
end

flash_count = Day11.new('day_11.txt').part_1

puts "Part one answer: #{ flash_count }"

step = Day11.new('day_11.txt').part_2

puts "Part two answer: #{ step }"