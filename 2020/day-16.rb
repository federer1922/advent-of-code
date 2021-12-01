# Part one

data = File.read("data_16.txt")

ranges = {}

fields = data.scan(/(\w+:.+)\n/)
fields = fields.flatten

nearby_tickets = data.match(/nearby tickets:\s?([\w+,\n]+)/).captures.first
nearby_tickets = nearby_tickets.split("\n").map { |ticket| ticket.split(",").map(&:to_i) }.flatten

fields.each_with_index do |field|
  field_name = field.match(/(\w+):/).captures.first
    
  range_set = field.split(" or ").map do |range| 
    range = range.scan(/\d+-\d+/).first  
    Range.new(*range.split("-").map(&:to_i)) 
  end
  ranges[field_name] = range_set
end

invalid_values = nearby_tickets.reject do |number|
  ranges.values.flatten.any? { |range| range.cover?(number) }
end
  
  puts "Part one answer: #{ invalid_values.reduce(:+)}"

