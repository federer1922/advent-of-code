data = File.read('data_4.txt')

passports = data.split("\n\n")

must_have = ["ecl", "pid", "eyr", "hcl", "byr", "iyr", "hgt"]

valid_passwords = []
passports.each do |passport|
  if must_have.all? { |field| passport.include? field } 
  valid_passwords << passport
  end
end

puts "Part one answer: #{ valid_passwords.count }" 