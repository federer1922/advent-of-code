# Part one

data = []

File.readlines("day_25.txt").each do |line|
  data << line.strip.to_i
end

card_key = data[0]
door_key = data[1]  
  
def loop_size (public_key)
  loop_size = 0
  key = 1
  until key == public_key
    key = (key * 7) % 20201227
    loop_size += 1
  end
  loop_size
end

card_key_loop_size = loop_size(card_key)
door_key_loop_size = loop_size(door_key)

def encryption_key (public_key, loop_size)
  key = 1
  loop_size.times do
    key = (key * public_key) % 20201227
  end
  key
end

key = encryption_key(card_key, door_key_loop_size)
puts "Part one answer: #{ key }" 