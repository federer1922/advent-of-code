data = []
File.read("day_22.txt").split("\n\n").each do |player|
  data << player
end

players_cards = data.map { |player| player.scan(/\n\d+/).map(&:to_i) }

player_1_deck = players_cards[0]
player_2_deck = players_cards[1]

until player_1_deck.size == 0 || player_2_deck.size == 0
    player_1_card = player_1_deck.shift
    player_2_card = player_2_deck.shift

    if player_1_card > player_2_card
      player_1_deck << player_1_card
      player_1_deck << player_2_card
    else
      player_2_deck << player_2_card
      player_2_deck << player_1_card
    end
end

score = 0

if player_1_deck.size > player_2_deck.size
  player_2_deck.reverse.each_with_index do |card, index|
    score += card * (index + 1)
  end
else
  player_2_deck.reverse.each_with_index do |card, index|
    score += card * (index + 1)
  end
end

puts "Part one answer: #{ score }"
