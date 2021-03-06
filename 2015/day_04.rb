require 'digest'

# Part one

key = File.read('day_04.txt')
number = 1
md5 = Digest::MD5.new
md5 << key

while true
  md5 << number.to_s

  break if md5.hexdigest.start_with?('00000')
  md5.reset 
  md5 << key
  number += 1
end

puts "Part one answer: #{ number }"

# Part two

number = 1
md5.reset 
md5 << key

while true
  md5 << number.to_s
  
  break if md5.hexdigest.start_with?('000000')
  md5.reset 
  md5 << key
  number += 1
end

puts "Part two answer: #{ number }"


