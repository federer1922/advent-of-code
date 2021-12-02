# Part one

data = File.read("day_19.txt")

rules, messages = data.split("\n\n")
messages = messages.split("\n")

rules_set = {}

rules.split("\n").each do |rule|
  key, rule = rule.split(": ")
  
  rule = rule.gsub((?"), "")
  rule = rule.gsub(/(\d+)/, '[\0]')

  if rule.include?("|")
    rule = "(#{ rule })"
  end 

  rules_set[key] = rule
end

until rules_set["0"] !~ /\d/
  rule_first = rules_set["0"]
  rule = rule_first.scan(/\d+/)[0]
  
  rule_first.gsub!(/\[#{ rule }\]/,  rules_set[rule])
end

rules_set["0"] = rules_set["0"].tr(" ", "")
valid_massages = Regexp.new("^#{ rules_set["0"] }$")

puts "Part one answer: #{ messages.count { |message| valid_massages.match(message) } }"

