# Part one

require 'set'

data = []
File.readlines('data_7.txt').each do |line|
data << line.strip
end

main_bags = Hash.new {|h,k| h[k] = [] }

data.each do |line|
  main_bag, contents = line.match(/(\w+ \w+) bags contain (.*)\./)[1, 2]

  sub_bags = contents.split(",").map {|bag| bag.match(/(\w+ \w+) bag/)[1]}.compact

  sub_bags.each do |sub_bag|
    main_bags[sub_bag] << main_bag
  end
end

bag_colours = Set.new

bag_colour = ["shiny gold"]

until bag_colour.none?
  bag = bag_colour.shift
  main_bags[bag].each do |main|
    bag_colours << main
    bag_colour << main
  end
end

puts "Part one answer: #{ bag_colours.size }"