# frozen_string_literal: true

# Transparent Origami
class Day13
  def solve_1
    input
    dots
    instructions
    grid
    part_one
  end

  def solve_2
    input
    dots
    instructions
    grid
    part_two
  end

  private

  def input
    @input = File.read('day_13.txt').split("\n\n")
  end

  def dots
    dots = @input[0].split("\n")
    xs = []
    ys = []
    @coordinates = []

    dots.each do |dot|
      x, y = dot.split(',').map(&:to_i)
      xs << x
      ys << y
      @coordinates << [x, y]
    end
    @x_size = xs.max + 1
    @y_size = ys.max + 1
  end

  def grid
    @grid = Array.new(@y_size) { Array.new(@x_size + 1, false) }

    @coordinates.each do |x, y|
      @grid[y][x] = true
    end
    @grid
  end

  def instructions
    instructions = @input[1].split("\n")
    @instructions = []

    instructions.each do |instruction|
      along, line = instruction.match(/(\w{1})=(\d+)/).captures
      @instructions << [along, line.to_i]
    end
    @instructions
  end

  def along_x(line)
    grid = @grid.transpose
    grid.delete_at(line)
    left = grid.shift(line).reverse
    x_max = grid[0].size - 1
    y_max = grid.size - 1

    (0..x_max).each do |x|
      (0..y_max).each do |y|
        left[y][x] = true if grid[y][x]
      end
    end
    @grid = left.reverse.transpose
  end

  def along_y(line)
    @grid.delete_at(line)
    top = @grid.shift(line)
    grid = @grid.reverse
    x_max = grid[0].size - 1
    y_max = grid.size - 1

    (0..x_max).each do |x|
      (0..y_max).each do |y|
        top[y][x] = true if grid[y][x]
      end
    end
    @grid = top
  end

  def boolean_to_pattern
    y_max = @grid.size - 1
    x_max = @grid[0].size - 1

    (0..x_max).each do |x|
      (0..y_max).each do |y|
        @grid[y][x] = @grid[y][x] ? '#' : '.'
      end
    end
    @grid.map(&:join)
  end

  def part_one
    along, line = @instructions.first
    along == 'x' ? along_x(line) : along_y(line)
    @grid.flatten.count(true)
  end

  def part_two
    @instructions.each do |along, line|
      along == 'x' ? along_x(line) : along_y(line)
    end
    boolean_to_pattern
  end
end

part_one = Day13.new.solve_1

puts "Part one answer: #{part_one}"

part_two = Day13.new.solve_2

puts 'Part two answer:'
puts part_two
