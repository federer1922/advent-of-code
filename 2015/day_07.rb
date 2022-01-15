# frozen_string_literal: true

# Some Assembly Required
class Day07
  def part_1
    input
    solve
  end

  def part_2(signal_a)
    input
    @queue.reject! { |b| b.end_with?('-> b') }
    @signals['b'] = signal_a
    solve
  end

  private

  def input
    @queue = File.readlines('day_07.txt').map(&:strip)
    @signals = {}
  end

  def direct(line, type)
    wire_1, wire = line.split(' -> ')
    if type == 'value'
      @signals[wire] = wire_1.to_i
    elsif type == 'wire' && @signals[wire_1]
      @signals[wire] = @signals[wire_1]
    else
      @queue << line
    end
  end

  def bitwise_and(line, type)
    instructions, wire = line.split(' -> ')
    wire_1, wire_2 = instructions.split(' AND ')
    if type == 'value' && @signals[wire_2]
      @signals[wire] = wire_1.to_i & @signals[wire_2]
    elsif type == 'wire' && @signals[wire_1] && @signals[wire_2]
      @signals[wire] = @signals[wire_1] & @signals[wire_2]
    else
      @queue << line
    end
  end

  def bitwise_or(line)
    instructions, wire = line.split(' -> ')
    wire_1, wire_2 = instructions.split(' OR ')
    if @signals[wire_1] && @signals[wire_2]
      @signals[wire] = @signals[wire_1] | @signals[wire_2]
    else
      @queue << line
    end
  end

  def lshift(line)
    instructions, wire = line.split(' -> ')
    wire_1, value = instructions.split(' LSHIFT ')
    if @signals[wire_1]
      @signals[wire] = @signals[wire_1] << value.to_i
    else
      @queue << line
    end
  end

  def rshift(line)
    instructions, wire = line.split(' -> ')
    wire_1, value = instructions.split(' RSHIFT ')
    if @signals[wire_1]
      @signals[wire] = @signals[wire_1] >> value.to_i
    else
      @queue << line
    end
  end

  def bitwise_not(line)
    instructions, wire = line.split(' -> ')
    wire_1 = instructions.match(/(\w+)$/).captures.first
    if @signals[wire_1]
      @signals[wire] = 65_535 - @signals[wire_1]
    else
      @queue << line
    end
  end

  def gates(line)
    case line
    when /^\d+ -/ # direct signal from value
      direct(line, 'value')
    when /\d+ AND/ # AND first signal from value
      bitwise_and(line, 'value')
    when /\w+ AND/ # AND first signal from wire
      bitwise_and(line, 'wire')
    when /OR/
      bitwise_or(line)
    when /LSHIFT/
      lshift(line)
    when /RSHIFT/
      rshift(line)
    when /NOT/
      bitwise_not(line)
    else # direct signal from wire
      direct(line, 'wire')
    end
  end

  def solve
    until @signals['a']
      line = @queue.shift
      gates(line)
    end
    @signals['a']
  end
end

part_one = Day07.new.part_1
puts "Part one answer: #{part_one}"

part_two = Day07.new.part_2(part_one)
puts "Part two answer: #{part_two}"
