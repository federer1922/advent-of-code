data = File.read('day_04.txt')

passports = data.split("\n\n")

must_have = ["ecl", "pid", "eyr", "hcl", "byr", "iyr", "hgt"]

valid_passports = []
passports.each do |passport|
  if must_have.all? { |field| passport.include? field } 
  valid_passports << passport
  end
end

puts "Part one answer: #{ valid_passports.count }" 
