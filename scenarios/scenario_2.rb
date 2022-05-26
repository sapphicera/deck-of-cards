require './deck.rb'
require './format/style.rb'

puts <<~TEST
============= SCENARIO 2 ============
user draws until next card is a face
=====================================
TEST

# logic checks to run with deck.cheat
def validate(deck)
  while deck.size >= 1
    if yield.rank.is_a?(String)
      puts "Player stopped drawing! The next card is: '#{yield.description}!'"
      break
    else
      puts "You drew a '#{deck.draw.description}'!"
    end
  end

  raise 'ERROR CAUGHT: DECK HAS NO CARDS REMAINING!' if deck.empty?
end

begin
  deck = Deck.new
  deck.shuffle

  # cheat to win basic implementation
  headers("1. Keep Drawing Until Face Card is Found!")
  validate(deck){ deck.cheat }

  # does deck cheat until deck is empty and is rescued
  headers("2. Longer Test of #1 (Multiple Pulls)")
  52.times do
    validate(deck){ deck.cheat }
    puts "\n✿ DRAW & NEXT TEST ✿"
    deck.draw
  end

rescue => e
  failed(e)
end
