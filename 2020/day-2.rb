# Part one

valid_passwords = []
File.readlines('data_2.txt').each do |line|
    
policy, password_n = line.split(":")
password = password_n.strip

range, letter = policy.split(" ")

min, max = range.split("-").map(&:to_i)

letter_count = password.chars.count { |x| x == letter }

letter_check = (min..max).include?(letter_count)
  if letter_check == true
    valid_passwords << letter_check 
  end
end

puts "Part one answer: #{ valid_passwords.count }"

# Part two

valid_passwords_2 = []
File.readlines('data_2.txt').each do |line|
    
policy, password_n = line.split(":")
password = password_n.strip

range, letter = policy.split(" ")

position_1, position_2 = range.split("-").map(&:to_i)

letter_check_2 = (password[position_1 - 1] == letter) ^ (password[position_2 - 1] == letter)

  if letter_check_2 == true
    valid_passwords_2 << letter_check_2 
  end

end

puts "Part two answer: #{ valid_passwords_2.count }"

